import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CouponEntity } from '../entities/coupon.entity';
import { OrderEntity } from '../entities/order.entity';

import { CommonCouponService } from './common-coupon.service';

@Module({
  imports: [TypeOrmModule.forFeature([OrderEntity, CouponEntity])],
  providers: [CommonCouponService],
  exports: [CommonCouponService],
})
export class CommonCouponModule {}
