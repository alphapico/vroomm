import { Field, ID, InputType, Int } from '@nestjs/graphql';

@InputType()
export class SubmitFeedbackInput {
  @Field(() => Int)
  score: number;
  description?: string;
  @Field(() => ID)
  orderId: number;
  @Field(() => [ID])
  parameterIds?: number[];
}
