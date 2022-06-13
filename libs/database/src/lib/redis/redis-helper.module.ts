import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DriverTransactionEntity } from '../entities/driver-transaction.entity';
import { DriverWalletEntity } from '../entities/driver-wallet.entity';
import { DriverEntity } from '../entities/driver.entity';
import { SharedDriverService } from '../order/shared-driver.service';
import { DriverRedisService } from './driver-redis.service';
import { OrderRedisService } from './order-redis.service';

@Module({
  imports: [
    TypeOrmModule.forFeature([
      DriverEntity,
      DriverWalletEntity,
      DriverTransactionEntity,
    ]),
  ],
  providers: [DriverRedisService, OrderRedisService, SharedDriverService],
  exports: [DriverRedisService, OrderRedisService],
})
export class RedisHelpersModule {}
