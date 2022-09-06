import { Inject, UseGuards } from '@nestjs/common';
import { Args, CONTEXT, Mutation, Resolver } from '@nestjs/graphql';
import { CommonCouponService } from '@vroom/coupon/common-coupon.service';

import { UserContext } from '../auth/authenticated-user';
import { GqlAuthGuard } from '../auth/jwt-gql-auth.guard';
import { OrderDTO } from '../order/dto/order.dto';
import { PassengerOrderService } from '../order/passenger-order.service';
import { PassengerWalletDTO } from '../wallet/dto/passenger-wallet.dto';
import { CouponService } from './coupon.service';

@Resolver(() => OrderDTO)
@UseGuards(GqlAuthGuard)
export class CouponResolver {
  constructor(
    private commonCouponService: CommonCouponService,
    private couponService: CouponService,
    private passengerOrderService: PassengerOrderService,
    @Inject(CONTEXT)
    private context: UserContext
  ) {}

  @Mutation(() => OrderDTO)
  async applyCoupon(
    @Args('code', { type: () => String }) code: string
  ): Promise<OrderDTO> {
    const currentOrder = await this.passengerOrderService.getCurrentOrder(
      this.context.req.user.id
    );
    return this.commonCouponService.applyCoupon(
      code,
      currentOrder.id,
      this.context.req.user.id
    );
  }

  @Mutation(() => PassengerWalletDTO)
  async redeemGiftCard(
    @Args('code', { type: () => String }) code: string
  ): Promise<PassengerWalletDTO> {
    return this.couponService.redeemGiftCard(code, this.context.req.user.id);
  }
}
