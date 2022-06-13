import { Field, ID, InputType, Int } from '@nestjs/graphql';
import { Point } from '@vroom/database';

@InputType()
export class CreateOrderInput {
  @Field(() => ID)
  passengerId: number;
  @Field(() => ID)
  serviceId!: number;
  points!: Point[];
  addresses!: string[];
  @Field(() => Int)
  intervalMinutes!: number;
}
