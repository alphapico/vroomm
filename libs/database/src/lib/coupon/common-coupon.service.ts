import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CouponEntity } from '../entities/coupon.entity';
import { OrderEntity } from '../entities/order.entity';
import { ForbiddenError } from 'apollo-server-fastify';
import { Repository } from 'typeorm';

@Injectable()
export class CommonCouponService {
  constructor(
    @InjectRepository(CouponEntity)
    private couponRepo: Repository<CouponEntity>,
    @InjectRepository(OrderEntity)
    private orderRepo: Repository<OrderEntity>
  ) {}

  applyCouponOnPrice(coupon: CouponEntity, price: number): number {
    if (coupon == null) return price;
    return price * ((100 - coupon.discountPercent) / 100) - coupon.discountFlat;
  }

  async checkCoupon(code: string, passengerId?: number): Promise<CouponEntity> {
    const coupon = await this.couponRepo.findOne({ where: { code: code } });
    if (coupon == null) {
      throw new ForbiddenError('Incorrect code');
    }
    if (coupon.expireAt == null || coupon.expireAt < new Date()) {
      throw new ForbiddenError('Coupon expired');
    }
    if (passengerId != null) {
      const ordersWithCoupon = await this.orderRepo.count({
        where: { passengerId, couponId: coupon.id },
      });
      if (ordersWithCoupon >= coupon.manyTimesUserCanUse) {
        throw new ForbiddenError('Coupon already used.');
      }
    }

    if (!coupon.isEnabled) {
      throw new ForbiddenError('Coupon is disabled.');
    }
    const timesCouponUsed = await this.orderRepo.count({
      where: { couponId: coupon.id },
    });
    if (timesCouponUsed >= coupon.manyUsersCanUse) {
      throw new ForbiddenError('Coupon usage limit exceeded.');
    }
    return coupon;
  }

  async applyCoupon(
    code: string,
    orderId: number,
    passengerId: number
  ): Promise<OrderEntity> {
    const coupon = await this.checkCoupon(code, passengerId);
    let order = await this.orderRepo.findOneOrFail({
      relations: { service: true },
      where: { id: orderId },
    });
    const finalCost = this.applyCouponOnPrice(
      coupon,
      order.costBest + order.waitMinutes * order.service.perMinuteWait
    );
    await this.orderRepo.update(order.id, {
      couponId: coupon.id,
      costAfterCoupon: finalCost,
    });
    order = await this.orderRepo.findOneOrFail({
      relations: { service: true },
      where: { id: orderId },
    });
    return order;
  }
}
