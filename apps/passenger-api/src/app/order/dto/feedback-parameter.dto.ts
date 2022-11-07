import { IDField } from '@ptc-org/nestjs-query-graphql';
import { Field, ID, ObjectType } from '@nestjs/graphql';

@ObjectType('FeedbackParameter')
export class FeedbackParameterDTO {
  @IDField(() => ID)
  id: number;
  @Field()
  title: string;
  @Field()
  isGood: boolean;
}
