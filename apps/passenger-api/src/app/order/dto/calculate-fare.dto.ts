import { ObjectType, registerEnumType, Field, Float } from '@nestjs/graphql';
import { Point } from '@vroom/database';
import { ServiceCategoryDTO } from '../../service/dto/service-category.dto';

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
  @Field(() => [Point])
  directions: Point[];
  @Field(() => [ServiceCategoryDTO])
  services: ServiceCategoryDTO[];
  @Field(() => CalculateFareError, { nullable: true })
  error?: CalculateFareError;
}
