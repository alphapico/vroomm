import { NestjsQueryGraphQLModule } from '@ptc-org/nestjs-query-graphql';
import { NestjsQueryTypeOrmModule } from '@ptc-org/nestjs-query-typeorm';
import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { RedisPubSubProvider } from '@vroom/database';
import { DriverTransactionEntity } from '@vroom/database/driver-transaction.entity';
import { DriverWalletEntity } from '@vroom/database/driver-wallet.entity';
import { DriverEntity } from '@vroom/database/driver.entity';
import { OrderEntity } from '@vroom/database/order.entity';
import { PassengerEntity } from '@vroom/database/passenger.entity';
import { PassengerTransactionEntity } from '@vroom/database/passenger-transaction.entity';
import { PassengerWalletEntity } from '@vroom/database/passenger-wallet.entity';
import { ServiceCategoryEntity } from '@vroom/database/service-category.entity';
import { ServiceEntity } from '@vroom/database/service.entity';
import { FirebaseNotificationModule } from '@vroom/order/firebase-notification-service/firebase-notification-service.module';
import { GoogleServicesModule } from '@vroom/order/google-services/google-services.module';
import { SharedOrderService } from '@vroom/order/shared-order.service';
import { RegionModule } from '@vroom/order/region/region.module';
import { SharedPassengerService } from '@vroom/order/shared-passenger.service';
import { ServiceService } from '@vroom/order/service.service';

import { OrderDTO } from './dto/order.dto';
import { OrderResolver } from './order.resolver';
import { DriverOrderQueryService } from './driver-order.query-service';
import { RedisHelpersModule } from '@vroom/redis/redis-helper.module';
import { CronJobService } from './cron-job.service';
import { DriverModule } from '../driver/driver.module';
import { SharedDriverService } from '@vroom/order/shared-driver.service';
import { OrderService } from './order.service';
import { OrderSubscriptionService } from './orde-subscription.service';
import { PassengerDTO } from './dto/passenger.dto';
import { OrderActivityEntity } from '@vroom/database/order-activity.entity';
import { ServiceOptionEntity } from '@vroom/database/service-option.entity';
import { CommonCouponModule } from '@vroom/coupon/common-coupon.module';

@Module({
  imports: [
    RedisHelpersModule,
    DriverModule,
    CommonCouponModule,
    TypeOrmModule.forFeature([
      OrderEntity,
      ServiceCategoryEntity,
      ServiceOptionEntity,
      ServiceEntity,
      PassengerEntity,
      PassengerWalletEntity,
      PassengerTransactionEntity,
      DriverEntity,
      DriverWalletEntity,
      DriverTransactionEntity,
    ]),
    RegionModule,
    FirebaseNotificationModule.register(),
    GoogleServicesModule,
    NestjsQueryGraphQLModule.forFeature({
      imports: [
        NestjsQueryTypeOrmModule.forFeature([
          OrderEntity,
          PassengerEntity,
          OrderActivityEntity,
        ]),
      ],
      pubSub: RedisPubSubProvider.provider(),
      dtos: [{ DTOClass: OrderDTO }],
      resolvers: [
        {
          DTOClass: PassengerDTO,
          EntityClass: PassengerEntity,
          read: { disabled: true },
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
        },
      ],
    }),
  ],
  providers: [
    OrderSubscriptionService,
    SharedOrderService,
    DriverOrderQueryService,
    OrderResolver,
    OrderService,
    ServiceService,
    SharedPassengerService,
    SharedDriverService,
    RedisPubSubProvider.provider(),
    CronJobService,
  ],
  exports: [DriverOrderQueryService],
})
export class OrderModule {}
