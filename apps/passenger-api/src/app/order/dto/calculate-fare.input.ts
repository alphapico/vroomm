import { InputType, Field } from '@nestjs/graphql';
import { Point } from '@vroom/database';

@InputType()
export class CalculateFareInput {
  @Field(() => [Point])
  points!: Point[];
  @Field({ nullable: true })
  twoWay?: boolean;
  @Field({ nullable: true })
  couponCode?: string;
  @Field(() => [String], { nullable: true })
  selectedOptionIds?: string[];
}
