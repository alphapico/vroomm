import { IDField } from '@ptc-org/nestjs-query-graphql';
import { Field, ID, ObjectType } from '@nestjs/graphql';

@ObjectType('CarColor')
export class CarColorDTO {
  @IDField(() => ID)
  id!: number;
  @Field()
  name!: string;
}
