import { InjectPubSub } from '@ptc-org/nestjs-query-graphql';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { OrderStatus } from '@vroom/database/enums/order-status.enum';
import { OrderActivityType } from '@vroom/database/enums/order-activity-type.enum';
import { OrderActivityEntity } from '@vroom/database/order-activity.entity';
import { OrderEntity } from '@vroom/database/order.entity';
import { OrderRedisService } from '@vroom/redis/order-redis.service';
import { RedisPubSub } from 'graphql-redis-subscriptions';
import { Repository } from 'typeorm';

@Injectable()
export class OrderService {
  constructor(
    @InjectRepository(OrderEntity)
    private orderRepository: Repository<OrderEntity>,
    @InjectRepository(OrderActivityEntity)
    private activityRepository: Repository<OrderActivityEntity>,
    private orderRedisService: OrderRedisService,
    @InjectPubSub()
    private pubSub: RedisPubSub
  ) {}

  async cancelOrder(orderId: number): Promise<OrderEntity> {
    const order = await this.orderRepository.findOne({
      relations: { service: true },
      where: { id: orderId },
    });
    this.activityRepository.insert({
      orderId: order.id,
      type: OrderActivityType.CanceledByOperator,
    });
    await this.orderRepository.update(order.id, {
      status: OrderStatus.Expired,
      finishTimestamp: new Date(),
      costAfterCoupon: 0,
    });
    this.orderRedisService.expire([order.id]);
    this.pubSub.publish('orderRemoved', { orderRemoved: order });
    return order;
  }
}
