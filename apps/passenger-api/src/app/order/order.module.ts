import {
  NestjsQueryGraphQLModule,
  PagingStrategies,
} from '@ptc-org/nestjs-query-graphql';
import { NestjsQueryTypeOrmModule } from '@ptc-org/nestjs-query-typeorm';
import { forwardRef, Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { RedisPubSubProvider } from '@vroom/database';
import { CarColorEntity } from '@vroom/database/car-color.entity';
import { CarModelEntity } from '@vroom/database/car-model.entity';
import { DriverTransactionEntity } from '@vroom/database/driver-transaction.entity';
import { DriverWalletEntity } from '@vroom/database/driver-wallet.entity';
import { DriverEntity } from '@vroom/database/driver.entity';
import { OrderEntity } from '@vroom/database/order.entity';
import { RegionEntity } from '@vroom/database/region.entity';
import { ServiceCategoryEntity } from '@vroom/database/service-category.entity';
import { SharedDriverService } from '@vroom/order/shared-driver.service';
import { DriverNotificationService } from '@vroom/order/firebase-notification-service/driver-notification.service';
import { GoogleServicesModule } from '@vroom/order/google-services.module';
import { RegionModule } from '@vroom/order/region.module';
import { SharedOrderService } from '@vroom/order/shared-order.service';
import { RedisHelpersModule } from '@vroom/redis/redis-helper.module';

import { GqlAuthGuard } from '../auth/jwt-gql-auth.guard';
import { PassengerModule } from '../passenger/passenger.module';
import { ServiceModule } from '../service/service.module';
import { CarColorDTO } from './dto/car-color.dto';
import { CarModelDTO } from './dto/car-model.dto';
import { DriverDTO } from './dto/driver.dto';
import { OrderDTO } from './dto/order.dto';
import { OrderResolver } from './order.resolver';
import { PassengerOrderService } from './passenger-order.service';
import { FeedbackEntity } from '@vroom/database/feedback.entity';
import { OrderSubscriptionService } from './order-subscription.service';
import { MediaEntity } from '@vroom/database/media.entity';
import { OrderActivityEntity } from '@vroom/database/order-activity.entity';
import { SharedOrderModule } from '@vroom/order/shared-order.module';
import { PassengerNotificationService } from '@vroom/order/firebase-notification-service/passenger-notification.service';
// import { CouponModule } from '../coupon/coupon.module';
import { FeedbackParameterEntity } from '@vroom/database/feedback-parameter.entity';
import { FeedbackParameterDTO } from './dto/feedback-parameter.dto';
import { ServiceOptionEntity } from '@vroom/database/service-option.entity';
import { UpdateOrderInput } from './dto/update-order.input';
import { PassengerOrderQueryService } from './passenger-order.query-service';
import { OrderRedisService } from '@vroom/redis/order-redis.service';
import { CommonCouponModule } from '@vroom/coupon/common-coupon.module';

@Module({
  imports: [
    TypeOrmModule.forFeature([
      OrderEntity,
      DriverEntity,
      DriverWalletEntity,
      DriverTransactionEntity,
      FeedbackEntity,
      OrderActivityEntity,
      FeedbackParameterEntity,
      ServiceOptionEntity,
    ]),
    CommonCouponModule,
    GoogleServicesModule,
    ServiceModule,
    PassengerModule,
    RegionModule,
    // forwardRef(() => CouponModule),
    RedisHelpersModule,
    SharedOrderModule,
    NestjsQueryGraphQLModule.forFeature({
      imports: [
        NestjsQueryTypeOrmModule.forFeature([
          OrderEntity,
          DriverEntity,
          CarColorEntity,
          CarModelEntity,
          RegionEntity,
          ServiceCategoryEntity,
          MediaEntity,
          FeedbackParameterEntity,
          OrderActivityEntity,
          FeedbackEntity,
        ]),
        CommonCouponModule,
        SharedOrderModule,
      ],
      pubSub: RedisPubSubProvider.provider(),
      services: [
        PassengerOrderQueryService,
        PassengerOrderService,
        OrderRedisService,
        DriverNotificationService,
      ],
      resolvers: [
        {
          EntityClass: OrderEntity,
          DTOClass: OrderDTO,
          UpdateDTOClass: UpdateOrderInput,
          ServiceClass: PassengerOrderQueryService,
          //Service: PassengerOrderQueryService,
          create: { disabled: true },
          update: { many: { disabled: true } },
          delete: { disabled: true },
          guards: [GqlAuthGuard],
        },
        {
          EntityClass: DriverEntity,
          DTOClass: DriverDTO,
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
          read: { disabled: true },
        },
        {
          EntityClass: CarModelEntity,
          DTOClass: CarModelDTO,
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
          read: { disabled: true },
        },
        {
          EntityClass: CarColorEntity,
          DTOClass: CarColorDTO,
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
          read: { disabled: true },
        },
        {
          EntityClass: FeedbackParameterEntity,
          DTOClass: FeedbackParameterDTO,
          pagingStrategy: PagingStrategies.NONE,
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
          read: { one: { disabled: true } },
        },
      ],
    }),
  ],
  providers: [
    OrderSubscriptionService,
    OrderResolver,
    SharedOrderService,
    PassengerOrderService,
    SharedDriverService,
    DriverNotificationService,
    PassengerNotificationService,
    RedisPubSubProvider.provider(),
  ],
  exports: [PassengerOrderService],
})
export class OrderModule {}
