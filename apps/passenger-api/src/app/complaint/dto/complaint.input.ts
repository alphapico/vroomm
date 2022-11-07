import {
  BeforeCreateOne,
  CreateOneInputType,
} from '@ptc-org/nestjs-query-graphql';
import { Field, ID, InputType } from '@nestjs/graphql';

@InputType()
@BeforeCreateOne((input: CreateOneInputType<ComplaintInput>) => {
  input.input.requestedByDriver = false;
  return input;
})
export class ComplaintInput {
  @Field(() => ID)
  orderId: number;
  @Field()
  subject: string;
  @Field({ nullable: true })
  content?: string;
  @Field({ nullable: true })
  requestedByDriver?: boolean;
}
