import { InjectPubSub } from '@ptc-org/nestjs-query-graphql';
import { Injectable, Logger } from '@nestjs/common';
import { Args, ID, Subscription } from '@nestjs/graphql';
import { Point } from '@vroom/database';
import { OrderEntity } from '@vroom/database/order.entity';
import { RedisPubSub } from 'graphql-redis-subscriptions';
import { OrderDTO } from './dto/order.dto';

@Injectable()
export class OrderSubscriptionService {
  constructor(
    @InjectPubSub()
    private pubSub: RedisPubSub
  ) {}

  @Subscription(() => OrderDTO, {
    filter(
      this: OrderSubscriptionService,
      payload: { orderUpdated: OrderEntity },
      variables,
      context
    ) {
      Logger.log(
        `validating order update on passenger side: ${
          payload.orderUpdated.passengerId == context.id
        }`
      );
      return context.id == payload.orderUpdated.passengerId;
    },
  })
  orderUpdated() {
    return this.pubSub.asyncIterator('orderUpdated');
  }

  @Subscription(() => Point, {
    filter(
      this: OrderSubscriptionService,
      payload: { driverLocationUpdated: { driverId: number; point: Point } },
      variables: { driverId: number },
      context
    ) {
      return variables.driverId == payload.driverLocationUpdated.driverId;
    },
  })
  driverLocationUpdated(
    @Args('driverId', { type: () => ID! }) driverId: number
  ) {
    return this.pubSub.asyncIterator('driverLocationUpdated');
  }
}
