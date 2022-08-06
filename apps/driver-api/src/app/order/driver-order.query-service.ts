import { QueryService } from '@ptc-org/nestjs-query-core';
import { InjectPubSub } from '@ptc-org/nestjs-query-graphql';
import { TypeOrmQueryService } from '@ptc-org/nestjs-query-typeorm';
import { Inject, Logger } from '@nestjs/common';
import { CONTEXT } from '@nestjs/graphql';
import { InjectRepository } from '@nestjs/typeorm';
import { DriverStatus } from '@vroom/database/enums/driver-status.enum';
import { OrderStatus } from '@vroom/database/enums/order-status.enum';
import { OrderActivityType } from '@vroom/database/enums/order-activity-type.enum';
import { OrderActivityEntity } from '@vroom/database/order-activity.entity';
import { OrderEntity } from '@vroom/database/order.entity';
import { PassengerNotificationService } from '@vroom/order/firebase-notification-service/passenger-notification.service';
import { GoogleServicesService } from '@vroom/order/google-services/google-services.service';
import { ServiceService } from '@vroom/order/service.service';
import { SharedDriverService } from '@vroom/order/shared-driver.service';
import { SharedOrderService } from '@vroom/order/shared-order.service';
import { DriverRedisService } from '@vroom/redis/driver-redis.service';
import { OrderRedisService } from '@vroom/redis/order-redis.service';
import { ForbiddenError } from 'apollo-server-core';
import { RedisPubSub } from 'graphql-redis-subscriptions';
import { Repository } from 'typeorm';

import { UserContext } from '../auth/authenticated-user';
import { UpdateOrderInput } from './dto/update-order.input';
import { OrderService } from './order.service';

@QueryService(OrderEntity)
export class DriverOrderQueryService extends TypeOrmQueryService<OrderEntity> {
  constructor(
    @InjectRepository(OrderEntity)
    public orderRepository: Repository<OrderEntity>,
    @InjectRepository(OrderActivityEntity)
    private activityRepository: Repository<OrderActivityEntity>,
    private driverService: SharedDriverService,
    private orderService: OrderService,
    private serviceService: ServiceService,
    private orderRedisService: OrderRedisService,
    private driverRedisService: DriverRedisService,
    private googleServices: GoogleServicesService,
    private sharedOrderService: SharedOrderService,
    @InjectPubSub()
    private pubSub: RedisPubSub,
    @Inject(CONTEXT) private context: UserContext,
    private passengerNotificationService: PassengerNotificationService
  ) {
    super(orderRepository);
  }

  async updateOne(id: number, update: UpdateOrderInput): Promise<OrderEntity> {
    let order = await this.orderRepository.findOne({
      relations: { passenger: true, service: true, options: true },
      where: { id },
    });
    switch (update.status) {
      case OrderStatus.DriverCanceled: {
        this.activityRepository.insert({
          orderId: id,
          type: OrderActivityType.CanceledByDriver,
        });
        this.passengerNotificationService.canceled(order.passenger);
        return this.orderService.cancelOrder(id);
      }

      case OrderStatus.DriverAccepted: {
        const [travel, driverLocation] = await Promise.all([
          this.orderRepository.findOne({ where: { id } }),
          this.driverRedisService.getDriverCoordinate(this.context.req.user.id),
        ]);
        this.activityRepository.insert({
          orderId: travel.id,
          type: OrderActivityType.DriverAccepted,
        });
        const allowedStatuses = [
          OrderStatus.Found,
          OrderStatus.NoCloseFound,
          OrderStatus.Requested,
          OrderStatus.Booked,
        ];
        if (travel == null || !allowedStatuses.includes(travel.status)) {
          throw new ForbiddenError('Already Taken');
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
        this.driverService.updateDriverStatus(
          this.context.req.user.id,
          DriverStatus.InService
        );
        //const order = await this.orderRepository.findOne(travel.id);
        await this.orderRedisService.expire([id]);
        const result = await super.updateOne(id, {
          status: OrderStatus.DriverAccepted,
          etaPickup: new Date(etaPickup),
          driverId: this.context.req.user.id,
        });
        result.driver = await this.driverService.driverRepo.findOne({
          relations: { car: true, carColor: true },
          where: { id: this.context.req.user.id },
        });
        result.service = await this.serviceService.getWithId(result.serviceId);
        this.pubSub.publish('orderUpdated', { orderUpdated: result });
        this.pubSub.publish('orderRemoved', { orderRemoved: result }); // This one has a filter to let know all except the one accepted.
        this.passengerNotificationService.accepted(order.passenger);
        return result;
      }

      case OrderStatus.Arrived:
      case OrderStatus.Started: {
        const result = await super.updateOne(id, { status: update.status });
        this.activityRepository.insert({
          orderId: id,
          type:
            update.status == OrderStatus.Arrived
              ? OrderActivityType.ArrivedToPickupPoint
              : OrderActivityType.Started,
        });
        //result.driver = await this.driverService.driverRepo.findOne(this.context.req.user.id, {relations: ['car', 'carColor']});
        if (update.status == OrderStatus.Arrived) {
          this.passengerNotificationService.arrived(order.passenger);
        } else {
          this.passengerNotificationService.started(order.passenger);
        }
        this.pubSub.publish('orderUpdated', { orderUpdated: result });
        return result;
      }

      case OrderStatus.Finished: {
        await this.sharedOrderService.finish(id, update.paidAmount);
        this.activityRepository.insert({
          orderId: id,
          type: OrderActivityType.ArrivedToDestination,
        });
        order = await this.orderRepository.findOne({
          relations: { passenger: true, service: true, options: true },
          where: { id },
        });
        if (order.paidAmount + update.paidAmount < order.costAfterCoupon) {
          this.passengerNotificationService.waitingForPostPay(order.passenger);
        } else {
          this.passengerNotificationService.finished(order.passenger);
        }
        this.pubSub.publish('orderUpdated', { orderUpdated: order });
        return order;
      }

      default:
        throw new ForbiddenError('Update status to this is not possible');
    }
  }
}
