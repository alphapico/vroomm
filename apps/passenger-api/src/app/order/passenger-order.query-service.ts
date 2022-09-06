import { QueryService } from '@ptc-org/nestjs-query-core';
import { InjectPubSub } from '@ptc-org/nestjs-query-graphql';
import { TypeOrmQueryService } from '@ptc-org/nestjs-query-typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { CommonCouponService } from '@vroom/coupon/common-coupon.service';
import { OrderStatus } from '@vroom/database/enums/order-status.enum';
import { OrderEntity } from '@vroom/database/order.entity';
import { ForbiddenError } from 'apollo-server-core';
import { RedisPubSub } from 'graphql-redis-subscriptions';
import { Repository } from 'typeorm';

import { UpdateOrderInput } from './dto/update-order.input';
import { PassengerOrderService } from './passenger-order.service';

@QueryService(OrderEntity)
export class PassengerOrderQueryService extends TypeOrmQueryService<OrderEntity> {
  constructor(
    @InjectRepository(OrderEntity)
    public orderRepository: Repository<OrderEntity>,
    private orderService: PassengerOrderService,
    private commonCouponService: CommonCouponService,
    @InjectPubSub()
    private pubSub: RedisPubSub
  ) {
    super(orderRepository);
  }

  async updateOne(id: number, update: UpdateOrderInput): Promise<OrderEntity> {
    let order = await this.orderRepository.findOne({
      relations: { service: true, coupon: true },
      where: { id },
    });
    if (update.couponCode != null) {
      await this.commonCouponService.applyCoupon(
        update.couponCode,
        id,
        order.passengerId
      );
    }
    delete update['couponCode'];
    order = await this.orderRepository.findOne({
      relations: { service: true, coupon: true },
      where: { id },
    });
    if (
      update.status != null &&
      update.status != OrderStatus.PassengerCanceled
    ) {
      throw new ForbiddenError('Update status to this is not possible');
    }
    let costAfterCoupon = order.costAfterCoupon;
    if (update.waitMinutes != null) {
      costAfterCoupon = this.commonCouponService.applyCouponOnPrice(
        order.coupon,
        order.costBest + order.service.perMinuteWait * update.waitMinutes
      );
    }
    const result = await super.updateOne(id, { ...update, costAfterCoupon });
    if (
      update.status != null &&
      update.status == OrderStatus.PassengerCanceled
    ) {
      await this.orderService.cancelOrder(id);
    }
    this.pubSub.publish('orderUpdated', { orderUpdated: result });
    return result;
  }
}
