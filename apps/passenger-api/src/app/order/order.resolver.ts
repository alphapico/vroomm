import { Inject, Logger, UseGuards } from '@nestjs/common';
import { Args, CONTEXT, ID, Mutation, Query, Resolver } from '@nestjs/graphql';
import { CommonCouponService } from '@vroom/coupon/common-coupon.service';
import { Point } from '@vroom/database';
import { OrderEntity } from '@vroom/database/order.entity';
import { SharedOrderService } from '@vroom/order/shared-order.service';
import { DriverRedisService } from '@vroom/redis/driver-redis.service';
import { UserContextOptional } from '../auth/authenticated-user';
import { GqlAuthGuard } from '../auth/jwt-gql-auth.guard';
import { GqlOptionalAuthGuard } from '../auth/jwt-optional-gql-auth.guard';
import { CalculateFareDTO } from './dto/calculate-fare.dto';
import { CalculateFareInput } from './dto/calculate-fare.input';
import { CreateOrderInput } from './dto/create-order.input';
import { CurrentOrder } from './dto/current-order.dto';
import { OrderDTO } from './dto/order.dto';
import { SubmitFeedbackInput } from './dto/submit-feedback.input';
import { PassengerOrderService } from './passenger-order.service';

@Resolver(() => OrderDTO)
export class OrderResolver {
  constructor(
    @Inject(CONTEXT) private context: UserContextOptional,
    private orderService: SharedOrderService,
    private passengerOrderService: PassengerOrderService,
    private driverRedisService: DriverRedisService,
    private commonCouponService: CommonCouponService
  ) {}

  @Query(() => OrderDTO)
  @UseGuards(GqlAuthGuard)
  async currentOrder(): Promise<OrderDTO> {
    return this.passengerOrderService.getCurrentOrder(
      this.context.req.user.id,
      { driver: { carColor: true, car: true }, conversation: true }
    );
    // return this.passengerOrderService.getCurrentOrder(this.context.req.user.id, [
    //   'driver',
    //   'driver.carColor',
    //   'driver.car',
    //   'conversation',
    // ]);
  }

  @Query(() => CurrentOrder)
  @UseGuards(GqlAuthGuard)
  async currentOrderWithLocation(): Promise<CurrentOrder> {
    const order = await this.passengerOrderService.getCurrentOrder(
      this.context.req.user.id,
      { driver: { carColor: true, car: true } }
    );
    // const order = await this.passengerOrderService.getCurrentOrder(
    //   this.context.req.user.id,
    //   ['driver', 'driver.carColor', 'driver.car']
    // );
    let driverLocation;
    if (order?.driver != null) {
      driverLocation = this.driverRedisService.getDriverCoordinate(
        order.driver.id
      );
    }
    return { order, driverLocation };
  }

  @Mutation(() => CalculateFareDTO)
  @UseGuards(GqlAuthGuard)
  async calculateFare(
    @Args('input', { type: () => CalculateFareInput }) input: CalculateFareInput
  ): Promise<CalculateFareDTO> {
    return this.orderService.calculateFare(input);
  }

  @Query(() => CalculateFareDTO)
  @UseGuards(GqlOptionalAuthGuard)
  async getFare(
    @Args('input', { type: () => CalculateFareInput }) input: CalculateFareInput
  ): Promise<CalculateFareDTO> {
    Logger.log(`userId:${this.context.req.user?.id}`);
    let coupon;
    if (input.couponCode != null) {
      coupon = await this.commonCouponService.checkCoupon(input.couponCode);
    }
    Logger.log(coupon);
    return this.orderService.calculateFare({
      ...input,
      coupon,
      passengerId: this.context.req.user?.id,
    });
  }

  @Mutation(() => OrderDTO)
  @UseGuards(GqlAuthGuard)
  async createOrder(
    @Args('input', { type: () => CreateOrderInput }) input: CreateOrderInput
  ): Promise<OrderDTO> {
    return this.orderService.createOrder({
      ...input,
      passengerId: this.context.req.user.id,
      optionIds: input.optionIds,
    });
  }

  @Mutation(() => OrderDTO)
  @UseGuards(GqlAuthGuard)
  async cancelOrder(): Promise<OrderDTO> {
    return this.passengerOrderService.cancelPassengerLastOrder(
      this.context.req.user.id
    );
  }

  @Mutation(() => OrderDTO)
  @UseGuards(GqlAuthGuard)
  async cancelBooking(
    @Args('id', { type: () => ID }) id: number
  ): Promise<OrderDTO> {
    return this.passengerOrderService.cancelOrder(id);
  }

  @Query(() => Point, { nullable: true })
  @UseGuards(GqlAuthGuard)
  async getCurrentOrderDriverLocation(): Promise<Point> {
    const order = await this.passengerOrderService.getCurrentOrder(
      this.context.req.user.id
    );
    if (order?.driverId != null) {
      Logger.log(`driver id: ${order.driverId}`);
      const coordinate = await this.driverRedisService.getDriverCoordinate(
        order.driverId
      );
      Logger.log(JSON.stringify(coordinate));
      return coordinate;
    } else {
      return null;
    }
  }

  @Query(() => [Point])
  async getDriversLocation(
    @Args('center', { type: () => Point, nullable: true }) center?: Point
  ): Promise<Point[]> {
    if (center == null) return [];
    const result = this.driverRedisService.getCloseWithoutIds(center, 10000);
    return result;
  }

  @Mutation(() => OrderDTO)
  @UseGuards(GqlAuthGuard)
  async submitReview(
    @Args('review', { type: () => SubmitFeedbackInput })
    review: SubmitFeedbackInput
  ): Promise<OrderEntity> {
    return this.passengerOrderService.submitReview(
      this.context.req.user.id,
      review
    );
  }
}
