import {
  Authorize,
  FilterableField,
  IDField,
} from '@ptc-org/nestjs-query-graphql';
import { Field, Float, ID, ObjectType } from '@nestjs/graphql';
import { UserContext } from '../../auth/authenticated-user';

@ObjectType('DriverWallet')
@Authorize({
  authorize: (context: UserContext) => ({
    driverId: { eq: context.req.user.id },
  }),
})
export class DriverWalletDTO {
  @IDField(() => ID)
  id: number;
  @Field(() => Float)
  balance: number;
  @Field()
  currency: string;
  @FilterableField(() => ID, { filterOnly: true })
  driverId: number;
}
