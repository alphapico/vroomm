import { Field, ID, InputType, Int } from '@nestjs/graphql';
import { Point } from '@vroom/database';

@InputType()
export class CreateOrderInput {
  @Field(() => Int)
  serviceId!: number;
  @Field(() => [Point])
  points!: Point[];
  @Field(() => [String])
  addresses!: string[];
  @Field(() => Int)
  intervalMinutes!: number;
  @Field({ nullable: true })
  twoWay?: boolean;
  @Field(() => [String], { nullable: true })
  optionIds?: string[];
  @Field({ nullable: true })
  couponCode?: string;
}
