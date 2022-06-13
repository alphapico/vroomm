import {
  NestjsQueryGraphQLModule,
  PagingStrategies,
} from '@ptc-org/nestjs-query-graphql';
import { NestjsQueryTypeOrmModule } from '@ptc-org/nestjs-query-typeorm';
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { RedisPubSubProvider } from '@vroom/database';
import { OrderActivityEntity } from '@vroom/database/order-activity.entity';
import { OrderMessageEntity } from '@vroom/database/order-message.entity';
import { OrderEntity } from '@vroom/database/order.entity';
import { SharedOrderModule } from '@vroom/order/shared-order.module';
import { RedisHelpersModule } from '@vroom/redis/redis-helper.module';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { DispatcherResolver } from './dispatcher.resolver';
import { OrderMessageDTO } from './dto/order-message.dto';
import { OrderDTO } from './dto/order.dto';
import { OrderSubscriptionService } from './order-subscription.service';
import { OrderService } from './order.service';

@Module({
  imports: [
    SharedOrderModule,
    RedisHelpersModule,
    TypeOrmModule.forFeature([OrderActivityEntity]),
    NestjsQueryGraphQLModule.forFeature({
      imports: [
        NestjsQueryTypeOrmModule.forFeature([OrderEntity, OrderMessageEntity]),
      ],
      pubSub: RedisPubSubProvider.provider(),
      resolvers: [
        {
          EntityClass: OrderEntity,
          DTOClass: OrderDTO,
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          enableAggregate: true,
          guards: [JwtAuthGuard],
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
        },
        {
          EntityClass: OrderMessageEntity,
          DTOClass: OrderMessageDTO,
          pagingStrategy: PagingStrategies.OFFSET,
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
          read: { disabled: true },
        },
      ],
    }),
  ],
  providers: [
    DispatcherResolver,
    OrderSubscriptionService,
    OrderService,
    RedisPubSubProvider.provider(),
  ],
})
export class OrderModule {}
