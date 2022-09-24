import { Field, ID, InputType } from '@nestjs/graphql';

@InputType()
export class OrderMessageInput {
  @Field(() => ID)
  orderId: number;
  @Field()
  content: string;
}
