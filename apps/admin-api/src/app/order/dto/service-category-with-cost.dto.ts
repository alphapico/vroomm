import {
  IDField,
  PagingStrategies,
  UnPagedRelation,
} from '@ptc-org/nestjs-query-graphql';
import { Field, ID, ObjectType } from '@nestjs/graphql';
import { ServiceWithCostDTO } from './service-with-cost.dto';

@ObjectType('ServiceCategoryWithCost')
export class ServiceCategoryWithCostDTO {
  @IDField(() => ID)
  id!: number;
  @Field()
  name!: string;
  @Field(() => ServiceWithCostDTO)
  services: ServiceWithCostDTO[];
}
