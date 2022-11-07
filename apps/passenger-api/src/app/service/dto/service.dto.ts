import {
  IDField,
  Relation,
  UnPagedRelation,
} from '@ptc-org/nestjs-query-graphql';
import { Field, Float, ID, Int, ObjectType } from '@nestjs/graphql';
import { ServicePaymentMethod } from '@vroom/database/enums/service-payment-method.enum';
import { MediaDTO } from '../../upload/media.dto';
import { ServiceOptionDTO } from './service-option.dto';

@ObjectType('Service')
@Relation('media', () => MediaDTO, { disableRemove: true, disableUpdate: true })
@UnPagedRelation('options', () => ServiceOptionDTO, {
  disableRemove: true,
  disableUpdate: true,
})
export class ServiceDTO {
  @IDField(() => ID)
  id!: number;
  @Field()
  name!: string;
  @Field({ nullable: true })
  description?: string;
  @Field(() => Int, { nullable: true })
  personCapacity?: number;
  @Field(() => ServicePaymentMethod)
  paymentMethod: ServicePaymentMethod;
  @Field(() => Float)
  cost: number;
  @Field(() => Float, { nullable: true })
  costAfterCoupon?: number;
  @Field(() => Float)
  cancellationTotalFee: number;
  @Field(() => Int)
  prepayPercent!: number;
  @Field()
  twoWayAvailable!: boolean;
}
