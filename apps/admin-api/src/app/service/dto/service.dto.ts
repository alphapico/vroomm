import {
  Authorize,
  FilterableField,
  IDField,
  PagingStrategies,
  Relation,
  UnPagedRelation,
} from '@ptc-org/nestjs-query-graphql';
import { Field, Float, ID, Int, ObjectType } from '@nestjs/graphql';
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

  @Field({ nullable: true })
  description?: string;

  @Field(() => Int, { nullable: true })
  personCapacity?: number;

  @FilterableField(() => ID)
  categoryId: number;

  @Field(() => Float)
  baseFare!: number;

  @Field(() => Float, { nullable: true })
  roundingFactor?: number;

  @Field(() => Float)
  perHundredMeters: number;

  @Field(() => Float)
  perMinuteDrive!: number;

  @Field(() => Float)
  perMinuteWait!: number;

  @Field(() => Float)
  prepayPercent!: number;

  @Field(() => Float)
  minimumFee!: number;

  @Field(() => Int)
  searchRadius!: number;

  @Field(() => ServicePaymentMethod)
  paymentMethod!: ServicePaymentMethod;

  @Field(() => Float)
  cancellationTotalFee!: number;

  @Field(() => Float)
  cancellationDriverShare!: number;

  @Field(() => Int)
  providerSharePercent!: number;

  @Field(() => Float)
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
