import { IDField } from '@ptc-org/nestjs-query-graphql';
import { Field, ID, ObjectType } from '@nestjs/graphql';
import { Point } from '@vroom/database';

@ObjectType('Address')
export class AddressDTO {
  @IDField(() => ID)
  id!: number;
  @Field()
  title!: string;
  @Field({ nullable: true })
  details?: string;
  @Field(() => Point)
  location!: Point;
}
