import { IDField, UnPagedRelation } from '@ptc-org/nestjs-query-graphql';
import { Field, ID, ObjectType } from '@nestjs/graphql';
import { ServiceDTO } from './service.dto';

//@UnPagedRelation('services', () => ServiceDTO)
@ObjectType('ServiceCategory')
export class ServiceCategoryDTO {
  @IDField(() => ID)
  id: number;
  @Field()
  name: string;
  @Field(() => [ServiceDTO])
  services: ServiceDTO[];
}
