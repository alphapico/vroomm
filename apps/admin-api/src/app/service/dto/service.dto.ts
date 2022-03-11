import {
  Authorize,
  FilterableField,
  IDField,
  PagingStrategies,
  Relation,
  UnPagedRelation,
} from '@ptc-org/nestjs-query-graphql';
import { Field, ID, Int, ObjectType } from '@nestjs/graphql';
import { DistanceMultiplier } from '@vroom/database';
import { TimeMultiplier } from '@vroom/database';
import { ServicePaymentMethod } from '@vroom/database/enums/service-payment-method.enum';
import { RegionDTO } from '../../region/dto/region.dto';
import { MediaDTO } from '../../upload/media.dto';
import { ServiceOptionDTO } from './service-option.dto';
import { ServiceAuthorizer } from './service.authorizer';

@ObjectType('Service')
@UnPagedRelation('regions', () => RegionDTO, {
  pagingStrategy: PagingStrategies.NONE,
})
@Relation('media', () => MediaDTO)
@Relation('options', () => ServiceOptionDTO)
@Authorize(ServiceAuthorizer)
export class ServiceDTO {
  @IDField(() => ID)
  id!: number;

  @Field()
  name!: string;

  @Field()
  description?: string;

  @Field(() => Int)
  personCapacity?: number;

  @FilterableField(() => ID)
  categoryId: number;

  @Field()
  baseFare!: number;

  @Field()
  roundingFactor?: number;

  @Field()
  perHundredMeters: number;

  @Field()
  perMinuteDrive!: number;

  @Field()
  perMinuteWait!: number;

  @Field()
  prepayPercent!: number;

  @Field()
  minimumFee!: number;

  @Field(() => Int)
  searchRadius!: number;

  @Field(() => ServicePaymentMethod)
  paymentMethod!: ServicePaymentMethod;

  @Field()
  cancellationTotalFee!: number;

  @Field()
  cancellationDriverShare!: number;

  @Field(() => Int)
  providerSharePercent!: number;

  @Field()
  providerShareFlat!: number;

  @Field()
  twoWayAvailable!: boolean;

  @Field(() => Int)
  maximumDestinationDistance!: number;

  @Field(() => [TimeMultiplier])
  timeMultipliers!: TimeMultiplier[];

  @Field(() => [DistanceMultiplier])
  distanceMultipliers!: DistanceMultiplier[];

  @Field(() => ID)
  mediaId!: number;
}
