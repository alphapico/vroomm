import { InjectPubSub } from '@ptc-org/nestjs-query-graphql';
import { Injectable, Logger } from '@nestjs/common';
import { Resolver, Subscription } from '@nestjs/graphql';
import { OrderEntity } from '@vroom/database/order.entity';
import { RedisPubSub } from 'graphql-redis-subscriptions';
import { AvailableOrderDTO } from './dto/available-order.dto';
import { OrderDTO } from './dto/order.dto';

@Injectable()
export class OrderSubscriptionService {
  constructor(
    @InjectPubSub()
    public pubSub: RedisPubSub
  ) {}

  @Subscription(() => OrderDTO, {
    filter(
      this: OrderSubscriptionService,
      payload: { orderCreated: AvailableOrderDTO; driverIds: string[] },
      variables,
      context
    ) {
      // Logger.log(payload);
      return payload.driverIds.includes(context.id);
    },
  })
  orderCreated() {
    return this.pubSub.asyncIterator('orderCreated');
  }

  @Subscription(() => OrderDTO, {
    filter(
      this: OrderSubscriptionService,
      payload: { orderUpdated: OrderEntity },
      variables,
      context
    ) {
      Logger.log(payload);
      return context.id == payload.orderUpdated.driverId;
    },
  })
  orderUpdated() {
    return this.pubSub.asyncIterator('orderUpdated');
  }

  @Subscription(() => OrderDTO, {
    filter(
      this: OrderSubscriptionService,
      payload: { orderRemoved: OrderEntity },
      variables,
      context
    ) {
      if (payload.orderRemoved.driverId == null) return true;
      return context.id != payload.orderRemoved.driverId;
    },
  })
  orderRemoved() {
    return this.pubSub.asyncIterator('orderRemoved');
  }
}
