import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CommonCouponModule } from '../coupon/common-coupon.module';
import { RedisPubSubProvider } from '../redis-pub-sub.provider';
import { DriverTransactionEntity } from '../entities/driver-transaction.entity';
import { DriverWalletEntity } from '../entities/driver-wallet.entity';
import { DriverEntity } from '../entities/driver.entity';
import { OrderActivityEntity } from '../entities/order-activity.entity';
import { OrderEntity } from '../entities/order.entity';
import { PassengerEntity } from '../entities/passenger.entity';
import { PassengerTransactionEntity } from '../entities/passenger-transaction.entity';
import { PassengerWalletEntity } from '../entities/passenger-wallet.entity';
import { ServiceCategoryEntity } from '../entities/service-category.entity';
import { ServiceOptionEntity } from '../entities/service-option.entity';
import { ServiceEntity } from '../entities/service.entity';
import { RedisHelpersModule } from '../redis/redis-helper.module';
import { SharedConfigurationService } from '../shared-configuration.service';
import { FirebaseNotificationModule } from './firebase-notification-service/firebase-notification-service.module';
import { GoogleServicesModule } from './google-services/google-services.module';
import { RegionModule } from './region/region.module';
import { ServiceService } from './service.service';
import { SharedDriverService } from './shared-driver.service';
import { SharedOrderService } from './shared-order.service';
import { SharedPassengerService } from './shared-passenger.service';

@Module({
  imports: [
    RedisHelpersModule,
    CommonCouponModule,
    TypeOrmModule.forFeature([
      ServiceCategoryEntity,
      ServiceOptionEntity,
      ServiceEntity,
      PassengerEntity,
      DriverEntity,
      DriverWalletEntity,
      DriverTransactionEntity,
      PassengerWalletEntity,
      PassengerTransactionEntity,
      OrderEntity,
      OrderActivityEntity,
    ]),
    RegionModule,
    GoogleServicesModule,
    FirebaseNotificationModule.register(),
  ],
  providers: [
    RedisPubSubProvider.provider(),
    ServiceService,
    SharedDriverService,
    SharedOrderService,
    SharedPassengerService,
    SharedConfigurationService,
  ],
  exports: [SharedDriverService, SharedOrderService, SharedPassengerService],
})
export class SharedOrderModule {}
