import {
  Authorize,
  FilterableField,
  IDField,
} from '@ptc-org/nestjs-query-graphql';
import { ID, ObjectType, Field } from '@nestjs/graphql';
import { Point } from '@vroom/database';
import { RegionAuthorizer } from './region.authorizer';

@ObjectType('Region')
@Authorize(RegionAuthorizer)
export class RegionDTO {
  @IDField(() => ID)
  id!: number;

  @Field()
  name!: string;

  @FilterableField(() => String)
  currency!: string;

  @Field()
  enabled!: boolean;

  @Field(() => [[Point]])
  location: Point[][];
}
