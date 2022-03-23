import { Inject, UseGuards } from '@nestjs/common';
import { Args, CONTEXT, Int, Mutation, Query, Resolver } from '@nestjs/graphql';
import { Point } from '@vroom/database';
import { TransactionAction } from '@vroom/database/enums/transaction-action.enum';
import { TransactionStatus } from '@vroom/database/enums/transaction-status.enum';
import { UserContext } from '../auth/authenticated-admin';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { DriverService } from './driver.service';
import { OnlineDriver, OnlineDriverWithData } from './dto/driver-location.dto';

@Resolver()
@UseGuards(JwtAuthGuard)
export class DriverResolver {
  constructor(
    private driverService: DriverService,
    @Inject(CONTEXT)
    private context: UserContext
  ) {}

  @Query(() => [OnlineDriver])
  async getDriversLocation(
    @Args('center', { type: () => Point }) center: Point,
    @Args('count', { type: () => Int }) count: number
  ): Promise<OnlineDriver[]> {
    return this.driverService.getDriversLocation(center, count);
  }

  @Query(() => [OnlineDriverWithData])
  async getDriversLocationWithData(
    @Args('center', { type: () => Point }) center: Point,
    @Args('count', { type: () => Int }) count: number
  ): Promise<OnlineDriverWithData[]> {
    return this.driverService.getDriversLocationWithData(center, count);
  }
}
