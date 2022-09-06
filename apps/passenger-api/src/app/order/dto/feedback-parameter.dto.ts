import { IDField } from '@ptc-org/nestjs-query-graphql';
import { ID, ObjectType } from '@nestjs/graphql';

@ObjectType('FeedbackParameter')
export class FeedbackParameterDTO {
  @IDField(() => ID)
  id: number;
  title: string;
  isGood: boolean;
}
