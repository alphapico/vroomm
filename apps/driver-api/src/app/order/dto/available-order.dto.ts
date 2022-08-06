import { Field, Int, ObjectType } from '@nestjs/graphql';
import { Point } from '@vroom/database';
import { OrderStatus } from '@vroom/database/enums/order-status.enum';

@ObjectType('AvailableOrder')
export class AvailableOrderDTO {
  id: number;
  createdOn: Date;
  startTimestamp?: Date;
  finishTimestamp?: Date;
  etaPickup?: Date;
  status: OrderStatus;
  expectedTimestamp: Date;
  costBest: number;
  @Field(() => Int)
  distanceBest: number;
  @Field(() => Int)
  durationBest: number;
  currency!: string;
  driverId?: number;
  addresses: string[];
  points: Point[];
}
