import {
  Authorize,
  FilterableField,
  IDField,
  Relation,
  UnPagedRelation,
} from '@ptc-org/nestjs-query-graphql';
import { Field, GraphQLTimestamp, ID, Int, ObjectType } from '@nestjs/graphql';
import { Point } from '@vroom/database';
import { OrderStatus } from '@vroom/database/enums/order-status.enum';

import { UserContext } from '../../auth/authenticated-user';
// import { OrderMessageDTO } from '../../chat/dto/order-message.dto';
import { PassengerDTO } from '../../passenger/dto/passenger.dto';
import { ServiceOptionDTO } from '../../service/dto/service-option.dto';
import { ServiceDTO } from '../../service/dto/service.dto';
import { PaymentGatewayDTO } from '../../wallet/dto/payment-gateway.dto';
import { DriverDTO } from './driver.dto';

@ObjectType('Order')
@Authorize({
  authorize: (context: UserContext) => ({
    passengerId: { eq: context.req.user.id },
  }),
})
@Relation('driver', () => DriverDTO, {
  nullable: true,
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
@Relation('paymentGateway', () => PaymentGatewayDTO, {
  nullable: true,
  disableRemove: true,
  disableUpdate: true,
})
// @UnPagedRelation('conversation', () => OrderMessageDTO, { relationName: 'conversation', disableRemove: true, disableUpdate: true })
export class OrderDTO {
  @IDField(() => ID)
  id: number;
  @FilterableField(() => OrderStatus)
  status: OrderStatus;
  @FilterableField(() => GraphQLTimestamp)
  createdOn: Date;
  @Field(() => Int)
  distanceBest!: number;
  @Field(() => Int)
  durationBest!: number;
  @Field(() => Int)
  waitMinutes!: number;
  points: Point[];
  addresses: string[];
  expectedTimestamp!: Date;
  startTimestamp?: Date;
  finishTimestamp?: Date;
  @FilterableField(() => ID)
  passengerId: number;
  @FilterableField(() => ID, { nullable: true })
  driverId?: number;
  costAfterCoupon: number;
  etaPickup?: Date;
  costBest: number;
  paidAmount: number;
  currency: string;
  directions?: Point[];
}
