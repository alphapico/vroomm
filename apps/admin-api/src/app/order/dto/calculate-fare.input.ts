import { Field, InputType } from '@nestjs/graphql';
import { Point } from '@vroom/database';

@InputType()
export class CalculateFareInput {
  @Field(() => [Point])
  points!: Point[];
}
