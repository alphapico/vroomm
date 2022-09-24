import { Field, Float, ID, Int, ObjectType } from '@nestjs/graphql';
import { Point } from '@vroom/database';
import { OrderStatus } from '@vroom/database/enums/order-status.enum';

@ObjectType('AvailableOrder')
export class AvailableOrderDTO {
  @Field(() => ID)
  id: number;
  @Field()
  createdOn: Date;
  @Field({ nullable: true })
  startTimestamp?: Date;
  @Field({ nullable: true })
  finishTimestamp?: Date;
  @Field({ nullable: true })
  etaPickup?: Date;
  @Field(() => OrderStatus)
  status: OrderStatus;
  @Field()
  expectedTimestamp: Date;
  @Field(() => Float)
  costBest: number;
  @Field(() => Int)
  distanceBest: number;
  @Field(() => Int)
  durationBest: number;
  @Field()
  currency!: string;
  @Field(() => ID, { nullable: true })
  driverId?: number;
  @Field(() => [String])
  addresses: string[];
  @Field(() => [Point])
  points: Point[];
}
