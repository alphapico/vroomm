import { FilterableField, IDField } from '@ptc-org/nestjs-query-graphql';
import { ID, ObjectType } from '@nestjs/graphql';

@ObjectType('FeedbackParameter')
export class FeedbackParameterDTO {
  @IDField(() => ID)
  id: number;
  @FilterableField()
  title: string;
  @FilterableField()
  isGood: boolean;
}
