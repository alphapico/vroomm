import { Field, Float, ObjectType, registerEnumType } from '@nestjs/graphql';
import { ServiceCategoryDTO } from '../../service/dto/service-category.dto';
import { ServiceCategoryWithCostDTO } from './service-category-with-cost.dto';

export enum CalculateFareError {
  RegionUnsupported = 'REGION_UNSUPPORTED',
  NoServiceInRegion = 'NO_SERVICE_IN_REGION',
}

registerEnumType(CalculateFareError, { name: 'CalculateFareError' });

@ObjectType()
export class CalculateFareDTO {
  @Field()
  currency: string;
  @Field(() => Float)
  distance: number;
  @Field(() => Float)
  duration: number;
  @Field(() => [ServiceCategoryWithCostDTO])
  services: ServiceCategoryWithCostDTO[];
  @Field(() => CalculateFareError, { nullable: true })
  error?: CalculateFareError;
}
