import { IDField } from '@ptc-org/nestjs-query-graphql';
import { Field, ID, ObjectType } from '@nestjs/graphql';

@ObjectType('Coupon')
export class CouponDTO {
  @IDField(() => ID)
  id: number;
  @Field()
  code: string;
  @Field()
  title: string;
  @Field()
  description: string;
  @Field()
  expireAt: Date;
}
