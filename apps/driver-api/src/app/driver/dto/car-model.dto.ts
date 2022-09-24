import { IDField } from '@ptc-org/nestjs-query-graphql';
import { Field, ID, ObjectType } from '@nestjs/graphql';

@ObjectType('CarModel')
export class CarModelDTO {
  @IDField(() => ID)
  id: number;
  @Field()
  name: string;
}
