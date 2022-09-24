import {
  Authorize,
  FilterableField,
  IDField,
  Relation,
  UnPagedRelation,
} from '@ptc-org/nestjs-query-graphql';
import { Field, Float, ID, Int, ObjectType } from '@nestjs/graphql';
import { Point } from '@vroom/database';
import { OrderStatus } from '@vroom/database/enums/order-status.enum';
import { UserContext } from '../../auth/authenticated-user';
import { PassengerDTO } from './passenger.dto';
import { ServiceDTO } from '../../service/dto/service.dto';
import { OrderMessageDTO } from '../../chat/dto/order-message.dto';
import { DriverDTO } from '../../driver/dto/driver.dto';
import { ServiceOptionDTO } from './service-option.dto';

@ObjectType('Order')
@Authorize({
  authorize: (context: UserContext) =>
    ({ driverId: { eq: context.req.user.id } } as unknown),
})
@Relation('driver', () => DriverDTO, {
  disableRemove: true,
  disableUpdate: true,
})
@Relation('passenger', () => PassengerDTO, {
  disableRemove: true,
  disableUpdate: true,
})
@Relation('service', () => ServiceDTO, {
  disableRemove: true,
  disableUpdate: true,
})
@UnPagedRelation('options', () => ServiceOptionDTO, {
  disableRemove: true,
  disableUpdate: true,
})
@UnPagedRelation('conversation', () => OrderMessageDTO, {
  relationName: 'conversation',
  disableRemove: true,
  disableUpdate: true,
})
export class OrderDTO {
  @IDField(() => ID)
  id: number;
  @FilterableField(() => OrderStatus)
  status: OrderStatus;
  @FilterableField()
  createdOn: Date;
  @Field(() => Int)
  distanceBest!: number;
  @Field(() => Int)
  durationBest!: number;
  @Field({ nullable: true })
  startTimestamp?: Date;
  @Field({ nullable: true })
  finishTimestamp?: Date;
  @Field({ nullable: true })
  etaPickup?: Date;
  @Field(() => Float)
  waitMinutes!: number;
  @Field()
  expectedTimestamp: Date;
  @FilterableField()
  costBest: number;
  @Field(() => Float)
  costAfterCoupon: number;
  @Field(() => Float)
  providerShare: number;
  @Field(() => Float)
  paidAmount: number;
  @Field()
  currency!: string;
  @FilterableField(() => ID, { filterOnly: true, nullable: true })
  driverId?: number;
  @Field(() => [String])
  addresses: string[];
  @Field(() => [Point])
  points: Point[];
  @Field(() => Float)
  tipAmount!: number;
  @Field(() => ID, { nullable: true })
  paymentGatewayId?: number;
  @Field(() => [Point])
  directions?: Point[];
}
