import {
  Authorize,
  IDField,
  UnPagedRelation,
} from '@ptc-org/nestjs-query-graphql';
import { Field, Float, ID, Int, ObjectType } from '@nestjs/graphql';
import { ServiceDTO } from '../../service/dto/service.dto';
import { CouponAuthorizer } from './coupon.authorizer';

@ObjectType('Coupon')
@UnPagedRelation('allowedServices', () => ServiceDTO)
@Authorize(CouponAuthorizer)
export class CouponDTO {
  @IDField(() => ID)
  id!: number;
  @Field()
  code: string;
  @Field()
  title: string;
  @Field()
  description: string;
  @Field(() => Int)
  manyUsersCanUse!: number;
  @Field(() => Int)
  manyTimesUserCanUse!: number;
  @Field(() => Float)
  minimumCost!: number;
  @Field(() => Float)
  maximumCost!: number;
  @Field()
  startAt!: Date;
  @Field()
  expireAt!: Date;
  @Field(() => Int)
  discountPercent!: number;
  @Field(() => Int)
  discountFlat!: number;
  @Field(() => Float)
  creditGift!: number;
  @Field()
  isEnabled!: boolean;
  @Field()
  isFirstTravelOnly!: boolean;
}
