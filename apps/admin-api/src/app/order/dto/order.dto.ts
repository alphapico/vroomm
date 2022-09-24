import {
  FilterableField,
  IDField,
  Relation,
  UnPagedRelation,
} from '@ptc-org/nestjs-query-graphql';
import { Field, Float, ID, Int, ObjectType } from '@nestjs/graphql';
import { Point } from '@vroom/database';
import { OrderStatus } from '@vroom/database/enums/order-status.enum';

import { ComplaintDTO } from '../../complaint/dto/complaint.dto';
import { CouponDTO } from '../../coupon/dto/coupon.dto';
import { DriverTransactionDTO } from '../../driver/dto/driver-transaction.dto';
import { DriverDTO } from '../../driver/dto/driver.dto';
import { PassengerTransactionDTO } from '../../passenger/dto/passenger-transaction.dto';
import { PassengerDTO } from '../../passenger/dto/passenger.dto';
import { ServiceDTO } from '../../service/dto/service.dto';
import { OrderMessageDTO } from './order-message.dto';
import { OrderActivityDTO } from './order-activity.dto';

@ObjectType('Order')
@Relation('driver', () => DriverDTO, { nullable: true })
@Relation('passenger', () => PassengerDTO)
@Relation('service', () => ServiceDTO)
@Relation('coupon', () => CouponDTO, { nullable: true })
@UnPagedRelation('complaints', () => ComplaintDTO)
@UnPagedRelation('conversation', () => OrderMessageDTO, {
  relationName: 'conversation',
})
@UnPagedRelation('passengerTransactions', () => PassengerTransactionDTO)
@UnPagedRelation('driverTransactions', () => DriverTransactionDTO)
@UnPagedRelation('activities', () => OrderActivityDTO, {
  disableUpdate: true,
  disableRemove: true,
})
export class OrderDTO {
  @IDField(() => ID)
  id!: number;
  @FilterableField()
  createdOn!: Date;
  @Field({ nullable: true })
  startTimestamp?: Date;
  @Field({ nullable: true })
  finishTimestamp?: Date;
  @FilterableField(() => OrderStatus)
  status: OrderStatus;
  @Field(() => Int)
  distanceBest: number;
  @Field(() => Int)
  durationBest: number;
  @Field(() => Float)
  costBest: number;
  @Field(() => Float)
  costAfterCoupon: number;
  @Field()
  currency: string;
  @Field(() => Float)
  waitMinutes!: number;
  @Field(() => [String])
  addresses: string[];
  @Field(() => [Point])
  points: Point[];
  @Field({ nullable: true })
  expectedTimestamp?: Date;
  @FilterableField(() => ID)
  passengerId: number;
  @FilterableField(() => ID, { nullable: true })
  driverId?: number;
}
