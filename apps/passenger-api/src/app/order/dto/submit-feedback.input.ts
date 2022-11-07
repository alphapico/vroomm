import { Field, ID, InputType, Int } from '@nestjs/graphql';

@InputType()
export class SubmitFeedbackInput {
  @Field(() => Int)
  score: number;
  @Field({ nullable: true })
  description?: string;
  @Field(() => ID)
  orderId: number;
  @Field(() => [ID], { nullable: true })
  parameterIds?: number[];
}
