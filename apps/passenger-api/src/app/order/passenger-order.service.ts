import { InjectPubSub } from '@ptc-org/nestjs-query-graphql';
import { Injectable, Logger } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { DriverDeductTransactionType } from '@vroom/database/enums/driver-deduct-transaction-type.enum';
import { DriverStatus } from '@vroom/database/enums/driver-status.enum';
import { OrderStatus } from '@vroom/database/enums/order-status.enum';
import { OrderActivityType } from '@vroom/database/enums/order-activity-type.enum';
import { PassengerDeductTransactionType } from '@vroom/database/enums/passenger-deduct-transaction-type.enum';
import { TransactionAction } from '@vroom/database/enums/transaction-action.enum';
import { TransactionStatus } from '@vroom/database/enums/transaction-status.enum';
import { FeedbackEntity } from '@vroom/database/feedback.entity';
import { OrderActivityEntity } from '@vroom/database/order-activity.entity';
import { OrderEntity } from '@vroom/database/order.entity';
import { DriverNotificationService } from '@vroom/order/firebase-notification-service/driver-notification.service';
import { SharedDriverService } from '@vroom/order/shared-driver.service';
import { SharedPassengerService } from '@vroom/order/shared-passenger.service';
import { OrderRedisService } from '@vroom/redis/order-redis.service';
import { ForbiddenError } from 'apollo-server-core';
import { RedisPubSub } from 'graphql-redis-subscriptions';
import { In, Repository } from 'typeorm';

import { SubmitFeedbackInput } from './dto/submit-feedback.input';

@Injectable()
export class PassengerOrderService {
  constructor(
    @InjectRepository(OrderEntity)
    private orderRepository: Repository<OrderEntity>,
    @InjectRepository(OrderActivityEntity)
    private activityRepository: Repository<OrderActivityEntity>,
    @InjectRepository(FeedbackEntity)
    private feedbackRepository: Repository<FeedbackEntity>,
    private passengerService: SharedPassengerService,
    private driverService: SharedDriverService,
    private orderRedisService: OrderRedisService,
    private driverNotificationService: DriverNotificationService,
    @InjectPubSub()
    private pubSub: RedisPubSub
  ) {}

  async getCurrentOrder(
    passengerId: number,
    relations: Record<string, any> = {}
  ) {
    return this.orderRepository.findOne({
      where: {
        passengerId,
        status: In([
          OrderStatus.Requested,
          OrderStatus.Booked,
          OrderStatus.Found,
          OrderStatus.NotFound,
          OrderStatus.NoCloseFound,
          OrderStatus.DriverAccepted,
          OrderStatus.Arrived,
          OrderStatus.Started,
          OrderStatus.WaitingForReview,
          OrderStatus.WaitingForPrePay,
          OrderStatus.WaitingForPostPay,
        ]),
      },
      order: { id: 'DESC' },
      relations,
    });
  }

  async getLastOrder(passengerId: number, relations: Record<string, any> = {}) {
    return this.orderRepository.findOne({
      where: { passengerId },
      order: { id: 'DESC' },
      relations,
    });
  }

  async cancelPassengerLastOrder(passengerId: number) {
    const order = await this.getCurrentOrder(passengerId);
    return this.cancelOrder(order.id);
  }

  async cancelOrder(orderId: number): Promise<OrderEntity> {
    await this.orderRepository.update(orderId, {
      status: OrderStatus.PassengerCanceled,
      finishTimestamp: new Date(),
      costAfterCoupon: 0,
    });
    const order = await this.orderRepository.findOne({
      relations: { service: true, driver: true, passenger: true },
      where: { id: orderId },
    });
    if (order.driverId != null && order.service.cancellationTotalFee > 0) {
      await Promise.all([
        this.passengerService.rechargeWallet({
          action: TransactionAction.Deduct,
          deductType: PassengerDeductTransactionType.OrderFee,
          amount: -order.service.cancellationTotalFee,
          currency: order.currency,
          passengerId: order.passengerId,
          status: TransactionStatus.Done,
        }),
        this.driverService.rechargeWallet({
          action: TransactionAction.Deduct,
          deductType: DriverDeductTransactionType.Commission,
          amount: order.service.cancellationDriverShare,
          currency: order.currency,
          driverId: order.driverId,
          status: TransactionStatus.Done,
        }),
      ]);
    }
    if (order.driverId == null) {
      this.pubSub.publish('orderRemoved', { orderRemoved: order });
      this.orderRedisService.expire([order.id]);
    } else {
      this.driverNotificationService.canceled(order.driver);
      await this.driverService.updateDriverStatus(
        order.driverId,
        DriverStatus.Online
      );
      this.pubSub.publish('orderUpdated', { orderUpdated: order });
    }
    this.activityRepository.insert({
      orderId: order.id,
      type: OrderActivityType.CanceledByPassenger,
    });
    return order;
  }

  async submitReview(
    passengerId: number,
    review: SubmitFeedbackInput
  ): Promise<OrderEntity> {
    let order = await this.orderRepository.findOne({
      where: { id: review.orderId },
    });
    if (order.passengerId != passengerId) {
      throw new ForbiddenError('Not Allowed');
    }
    if (order.reviewId != null) {
      await this.feedbackRepository.delete(order.reviewId);
    }
    this.feedbackRepository.save({
      ...review,
      driverId: order.driverId,
      parameters: (review.parameterIds ?? []).map((id) => ({ id })),
    });
    this.activityRepository.insert({
      orderId: order.id,
      type: OrderActivityType.Reviewed,
    });
    await this.orderRepository.update(order.id, {
      status: OrderStatus.Finished,
    });
    order = await this.orderRepository.findOne({
      where: { id: review.orderId },
    });
    return order;
  }
}
