import { InputType, Field } from '@nestjs/graphql';
import { Point } from '@vroom/database';

@InputType()
export class CalculateFareInput {
  points!: Point[];
  twoWay?: boolean;
  @Field()
  couponCode?: string;
  selectedOptionIds?: string[];
}
