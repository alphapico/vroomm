import { InjectPubSub } from '@ptc-org/nestjs-query-graphql';
import { Injectable } from '@nestjs/common';
import { Subscription } from '@nestjs/graphql';
import { RedisPubSub } from 'graphql-redis-subscriptions';
import { OrderMessageDTO } from './dto/order-message.dto';

@Injectable()
export class ChatSubscriptionService {
  constructor(
    @InjectPubSub()
    private pubSub: RedisPubSub
  ) {}

  @Subscription(() => OrderMessageDTO, {
    filter(
      this: ChatSubscriptionService,
      payload: { newMessageReceived: OrderMessageDTO; passengerId: number },
      variables,
      context
    ) {
      return context.id == payload.passengerId;
    },
  })
  newMessageReceived() {
    return this.pubSub.asyncIterator('newMessageForPassenger');
  }
}
