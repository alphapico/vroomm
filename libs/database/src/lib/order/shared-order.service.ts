import { InjectPubSub } from '@ptc-org/nestjs-query-graphql';
import { Injectable, Logger } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CommonCouponService } from '../coupon/common-coupon.service';
import { CouponEntity } from '../entities/coupon.entity';
import { DriverDeductTransactionType } from '../entities/enums/driver-deduct-transaction-type.enum';
import { DriverRechargeTransactionType } from '../entities/enums/driver-recharge-transaction-type.enum';
import { DriverStatus } from '../entities/enums/driver-status.enum';
import { OrderActivityType } from '../entities/enums/order-activity-type.enum';
import { PassengerDeductTransactionType } from '../entities/enums/passenger-deduct-transaction-type.enum';
import { ServiceOptionType } from '../entities/enums/service-option-type.enum';
import { ServicePaymentMethod } from '../entities/enums/service-payment-method.enum';
import { TransactionAction } from '../entities/enums/transaction-action.enum';
import { TransactionStatus } from '../entities/enums/transaction-status.enum';
import { OrderActivityEntity } from '../entities/order-activity.entity';
import { ServiceOptionEntity } from '../entities/service-option.entity';
import { ForbiddenError } from 'apollo-server-fastify';
import { RedisPubSub } from 'graphql-redis-subscriptions';
import { In, Repository } from 'typeorm';

import { OrderStatus } from '../entities/enums/order-status.enum';
import { OrderEntity } from '../entities/order.entity';
import { ServiceCategoryEntity } from '../entities/service-category.entity';
import { Point } from '../interfaces/point';
import {
  DriverLocationWithId,
  DriverRedisService,
} from '../redis/driver-redis.service';
import { OrderRedisService } from '../redis/order-redis.service';
import { DriverNotificationService } from './firebase-notification-service/driver-notification.service';
import { PassengerNotificationService } from './firebase-notification-service/passenger-notification.service';
import { GoogleServicesService } from './google-services/google-services.service';
import { RegionService } from './region/region.service';
import { ServiceService } from './service.service';
import { SharedDriverService } from './shared-driver.service';
import { SharedPassengerService } from './shared-passenger.service';

@Injectable()
export class SharedOrderService {
  constructor(
    @InjectRepository(OrderEntity)
    private orderRepository: Repository<OrderEntity>,
    @InjectRepository(OrderActivityEntity)
    private activityRepository: Repository<OrderActivityEntity>,
    private regionService: RegionService,
    @InjectRepository(ServiceCategoryEntity)
    private serviceCategoryRepository: Repository<ServiceCategoryEntity>,
    @InjectRepository(ServiceOptionEntity)
    private serviceOptionRepository: Repository<ServiceOptionEntity>,
    private googleServices: GoogleServicesService,
    private servicesService: ServiceService,
    private passengerService: SharedPassengerService,
    private driverRedisService: DriverRedisService,
    private orderRedisService: OrderRedisService,
    private driverService: SharedDriverService,
    private commonCouponService: CommonCouponService,
    @InjectPubSub()
    private pubSub: RedisPubSub,
    private driverNotificationService: DriverNotificationService,
    private passengerNotificationService: PassengerNotificationService
  ) {}

  async calculateFare(input: {
    points: Point[];
    twoWay?: boolean;
    coupon?: CouponEntity;
    passengerId?: number;
  }) {
    const regions = await this.regionService.getRegionWithPoint(
      input.points[0]
    );
    if (regions.length < 1) {
      throw new ForbiddenError(CalculateFareError.RegionUnsupported);
    }
    const servicesInRegion = await this.regionService.getRegionServices(
      regions[0].id
    );
    if (servicesInRegion.length < 1) {
      throw new ForbiddenError(CalculateFareError.NoServiceInRegion);
    }
    if ((input.twoWay ?? false) && input.points.length > 1) {
      input.points.push(input.points[0]);
    }
    const metrics =
      servicesInRegion.findIndex((x) => x.perHundredMeters > 0) > -1
        ? await this.googleServices.getSumDistanceAndDuration(input.points)
        : { distance: 0, duration: 0, directions: [] };
    const cats = await this.serviceCategoryRepository.find({
      relations: { services: { media: true } },
    });
    let isResident = process.env.MOTAXI == null;
    if (input.passengerId != null) {
      const passenger = await this.passengerService.findById(input.passengerId);
      isResident = passenger?.isResident ?? process.env.MOTAXI == null;
    }
    const _cats = cats
      .map((cat) => {
        const { services, ..._cat } = cat;

        const _services = services
          .filter(
            (x) => servicesInRegion.filter((y) => y.id == x.id).length > 0
          )
          .map((service) => {
            const cost = this.servicesService.calculateCost(
              service,
              metrics.distance,
              metrics.duration,
              new Date(),
              isResident
            );
            if (input.coupon == null) {
              return {
                ...service,
                cost,
              };
            } else {
              const costAfterCoupon =
                this.commonCouponService.applyCouponOnPrice(input.coupon, cost);
              return {
                ...service,
                cost,
                costAfterCoupon,
              };
            }
          });
        return {
          ..._cat,
          services: _services,
        };
      })
      .filter((x) => x.services.length > 0);
    return {
      ...metrics,
      currency: regions[0].currency,
      services: _cats,
    };
  }

  async createOrder(input: {
    passengerId: number;
    serviceId: number;
    intervalMinutes: number;
    points: Point[];
    addresses: string[];
    operatorId?: number;
    twoWay?: boolean;
    optionIds?: string[];
    couponCode?: string;
  }): Promise<OrderEntity> {
    const service = await this.servicesService.getWithId(input.serviceId);
    if (service == undefined) {
      throw new ForbiddenError('SERVICE_NOT_FOUND');
    }
    const closeDrivers = await this.driverRedisService.getClose(
      input.points[0],
      service.searchRadius
    );
    const driverIds = closeDrivers.map((x: DriverLocationWithId) => x.driverId);
    const driversWithService =
      await this.driverService.getOnlineDriversWithServiceId(
        driverIds,
        input.serviceId
      );
    let optionFee = 0;
    let options: ServiceOptionEntity[] = [];
    if (input.optionIds != null) {
      options = await this.serviceOptionRepository.findBy({
        id: In(input.optionIds),
      });
      if (
        options.filter((option) => option.type == ServiceOptionType.TwoWay)
          .length > 0
      ) {
        input.points.push(input.points[0]);
      }
      const paidOptions = options.filter(
        (option) => option.type == ServiceOptionType.Paid
      );
      optionFee =
        paidOptions.length == 0
          ? 0
          : paidOptions
              .map((option) => option.additionalFee ?? 0)
              .reduce(
                (previous: number, current: number) => (current += previous)
              );
    }
    const metrics =
      service.perHundredMeters > 0
        ? await this.googleServices.getSumDistanceAndDuration(input.points)
        : { distance: 0, duration: 0, directions: [] };
    const eta = new Date(
      new Date().getTime() + (input.intervalMinutes | 0) * 60 * 1000
    );
    const passenger = await this.passengerService.findById(input.passengerId);
    const cost =
      this.servicesService.calculateCost(
        service,
        metrics.distance,
        metrics.duration,
        eta,
        passenger?.isResident
      ) + optionFee;
    const regions = await this.regionService.getRegionWithPoint(
      input.points[0]
    );
    if (
      service.maximumDestinationDistance != 0 &&
      metrics.distance > service.maximumDestinationDistance
    ) {
      throw new ForbiddenError('DISTANCE_TOO_FAR');
    }
    let shouldPrePay = false;
    const paidAmount = 0;
    if (service.prepayPercent > 0) {
      const balance = await this.passengerService.getPassengerCreditInCurrency(
        input.passengerId,
        regions[0].currency
      );
      const amountNeedsToBePrePaid = (cost * service.prepayPercent) / 100;
      if (balance < amountNeedsToBePrePaid) {
        shouldPrePay = true;
      } else {
        // await this.passengerService.rechargeWallet({
        //     amount: -amountNeedsToBePrePaid,
        //     currency: regions[0].currency,
        //     action: TransactionAction.Deduct,
        //     deductType: PassengerDeductTransactionType.OrderFee,
        //     status: TransactionStatus.Done,
        //     passengerId: input.passengerId
        // });
        // paidAmount = amountNeedsToBePrePaid;
      }
    }
    let order: OrderEntity = await this.orderRepository.save({
      serviceId: input.serviceId,
      currency: regions[0].currency,
      passengerId: input.passengerId,
      points: input.points,
      addresses: input.addresses.map((address) => address.replace(', ', '-')),
      distanceBest: metrics.distance,
      durationBest: metrics.duration,
      directions: metrics.directions,
      status: shouldPrePay
        ? OrderStatus.WaitingForPrePay
        : input.intervalMinutes > 30
        ? OrderStatus.Booked
        : driversWithService.length < 1
        ? OrderStatus.NoCloseFound
        : OrderStatus.Requested,
      paidAmount: paidAmount,
      costBest: cost,
      costAfterCoupon: cost,
      expectedTimestamp: eta,
      operatorId: input.operatorId,
      providerShare:
        service.providerShareFlat + (service.providerSharePercent * cost) / 100,
      options: options,
    });
    if (input.couponCode != null) {
      order = await this.commonCouponService.applyCoupon(
        input.couponCode,
        order.id,
        passenger.id
      );
    }
    let activityType = OrderActivityType.RequestedByPassenger;
    if (input.intervalMinutes > 0) {
      activityType =
        input.operatorId == null
          ? (activityType = OrderActivityType.BookedByPassenger)
          : OrderActivityType.BookedByOperator;
    } else {
      activityType =
        input.operatorId == null
          ? (activityType = OrderActivityType.RequestedByPassenger)
          : OrderActivityType.RequestedByOperator;
    }
    this.activityRepository.insert({ orderId: order.id, type: activityType });
    await this.orderRedisService.add({ ...order }, input.intervalMinutes | 0);
    if ((input.intervalMinutes ?? 0) < 30 && !shouldPrePay) {
      this.orderRedisService.driverNotified(order.id, driversWithService);
      this.pubSub.publish('orderCreated', {
        orderCreated: order,
        driverIds: driversWithService.map((driver) => driver.id),
      });
      this.driverNotificationService.requests(driversWithService);
    }
    return order;
  }

  async processPrePay(orderId: number) {
    const order: OrderEntity = await this.orderRepository.findOneOrFail({
      relations: { service: true, driver: true, passenger: true },
      where: { id: orderId },
    });
    const passengerCredit =
      await this.passengerService.getPassengerCreditInCurrency(
        order.passengerId,
        order.currency
      );
    if (
      passengerCredit <
      (order.costAfterCoupon * order.service.prepayPercent) / 100
    ) {
      throw new ForbiddenError('Credit is not enough');
    }
    await this.orderRepository.update(order.id, {
      status: OrderStatus.Requested,
    });
    const closeDriverIds = (
      await this.driverRedisService.getClose(
        order.points[0],
        order.service.searchRadius
      )
    ).map((x: DriverLocationWithId) => x.driverId);
    const driversWithService =
      await this.driverService.getOnlineDriversWithServiceId(
        closeDriverIds,
        order.serviceId
      );
    this.orderRedisService.driverNotified(order.id, driversWithService);
    this.pubSub.publish('orderCreated', {
      orderCreated: order,
      driverIds: driversWithService.map((driver) => driver.id),
    });
    this.driverNotificationService.requests(driversWithService);
    return this.orderRepository.findOneOrFail({
      relations: { service: true, driver: true, passenger: true },
      where: { id: orderId },
    });
  }

  async finish(orderId: number, cashAmount = 0.0) {
    const order: OrderEntity = await this.orderRepository.findOneOrFail({
      relations: { service: true, driver: true, passenger: true },
      where: { id: orderId },
    });
    if (
      order.service.paymentMethod == ServicePaymentMethod.OnlyCredit &&
      cashAmount > 0
    ) {
      throw new ForbiddenError(
        'Cash payment is not available for this service.'
      );
    }
    const passengerCredit =
      await this.passengerService.getPassengerCreditInCurrency(
        order.passengerId,
        order.currency
      );
    const providerPercent =
      order.passenger.isResident === false
        ? order.service.providerSharePercent * order.service.touristMultiplier
        : order.service.providerSharePercent;
    const commission =
      (providerPercent * order.costAfterCoupon) / 100 +
      order.service.providerShareFlat;
    const unPaidAmount =
      order.costAfterCoupon - order.paidAmount + order.tipAmount;
    if (passengerCredit + cashAmount < unPaidAmount) {
      await this.orderRepository.update(order.id, {
        status: OrderStatus.WaitingForPostPay,
      });
      return;
    }
    if (!order.driverId) {
      throw new ForbiddenError('no driverId');
    }
    await this.driverService.rechargeWallet({
      status: TransactionStatus.Done,
      driverId: order.driverId,
      currency: order.currency,
      action: TransactionAction.Deduct,
      deductType: DriverDeductTransactionType.Commission,
      amount: -1 * commission,
      orderId: order.id,
    });
    if (order.costAfterCoupon - cashAmount > 0) {
      await this.driverService.rechargeWallet({
        status: TransactionStatus.Done,
        driverId: order.driverId,
        currency: order.currency,
        orderId: order.id,
        action: TransactionAction.Recharge,
        rechargeType: DriverRechargeTransactionType.OrderFee,
        amount: order.costAfterCoupon - cashAmount + order.tipAmount,
      });
    }
    if (passengerCredit > 0 && cashAmount < unPaidAmount) {
      await this.passengerService.rechargeWallet({
        status: TransactionStatus.Done,
        action: TransactionAction.Deduct,
        deductType: PassengerDeductTransactionType.OrderFee,
        currency: order.currency,
        orderId: order.id,
        amount: -1 * (unPaidAmount - cashAmount),
        passengerId: order.passengerId,
      });
    }
    await this.orderRepository.update(order.id, {
      paidAmount: order.costAfterCoupon,
      status: OrderStatus.WaitingForReview,
      finishTimestamp: new Date(),
    });
    await this.driverService.updateDriverStatus(
      order.driverId,
      DriverStatus.Online
    );
    this.activityRepository.insert({
      orderId: order.id,
      type: OrderActivityType.Paid,
    });
  }

  async assignOrderToDriver(orderId: number, driverId: number) {
    const [travel, driverLocation] = await Promise.all([
      this.orderRepository.findOne({
        relations: { driver: { car: true, carColor: true }, service: true },
        where: { id: orderId },
      }),
      this.driverRedisService.getDriverCoordinate(driverId),
    ]);
    this.activityRepository.insert({
      orderId: orderId,
      type: OrderActivityType.DriverAccepted,
    });
    //  const allowedStatuses = [OrderStatus.Found, OrderStatus.NoCloseFound, OrderStatus.Requested, OrderStatus.Booked];
    // if (travel == null || !allowedStatuses.includes(travel.status)) {
    if (travel == null) {
      throw new ForbiddenError('Already Taken');
    }

    if (travel.driver == null) {
      throw new ForbiddenError('No Driver');
    }
    if (travel.driverId != null) {
      this.driverNotificationService.canceled(travel.driver);
      await this.driverService.updateDriverStatus(
        travel.driverId,
        DriverStatus.Online
      );
      travel.status = OrderStatus.PassengerCanceled;
      this.pubSub.publish('orderUpdated', { orderUpdated: travel });
    }
    const metrics =
      driverLocation != null
        ? await this.googleServices.getSumDistanceAndDuration([
            travel.points[0],
            driverLocation,
          ])
        : { distance: 0, duration: 0 };
    const dt = new Date();
    const etaPickup = dt.setSeconds(dt.getSeconds() + metrics.duration);
    this.driverService.updateDriverStatus(driverId, DriverStatus.InService);
    await this.orderRedisService.expire([orderId]);
    this.orderRepository.update(orderId, {
      status: OrderStatus.DriverAccepted,
      etaPickup: new Date(etaPickup),
      driverId,
    });
    const result = await this.orderRepository.findOneOrFail({
      relations: { driver: { car: true, carColor: true }, service: true },
      where: { id: orderId },
    });
    this.pubSub.publish('orderUpdated', { orderUpdated: result });
    this.pubSub.publish('orderRemoved', { orderRemoved: result }); // This one has a filter to let know all except the one accepted.
    this.passengerNotificationService.bookingAssigned(
      result.passenger,
      result.expectedTimestamp.toISOString()
    );

    if (result.driver == null) {
      throw new ForbiddenError('No Driver');
    }

    this.driverNotificationService.assigned(
      result.driver,
      result.expectedTimestamp.toTimeString(),
      result.addresses[0],
      result.addresses[result.addresses.length - 1]
    );
    return result;
  }
}

enum CalculateFareError {
  RegionUnsupported = 'REGION_UNSUPPORTED',
  NoServiceInRegion = 'NO_SERVICE_IN_REGION',
}
