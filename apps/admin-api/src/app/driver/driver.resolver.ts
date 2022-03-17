import { Inject, UseGuards } from '@nestjs/common';
import { Args, CONTEXT, Int, Mutation, Query, Resolver } from '@nestjs/graphql';
import { Point } from '@vroom/database';
import { TransactionAction } from '@vroom/database/enums/transaction-action.enum';
import { TransactionStatus } from '@vroom/database/enums/transaction-status.enum';
import { UserContext } from '../auth/authenticated-admin';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { DriverService } from './driver.service';

@Resolver()
@UseGuards(JwtAuthGuard)
export class DriverResolver {
  constructor(
    private driverService: DriverService,
    @Inject(CONTEXT)
    private context: UserContext
  ) {}
}
