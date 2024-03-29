import {
  Authorize,
  FilterableField,
  IDField,
} from '@ptc-org/nestjs-query-graphql';
import { Field, Float, ID, ObjectType } from '@nestjs/graphql';
import { UserContext } from '../../auth/authenticated-user';

@ObjectType('PassengerWallet')
@Authorize({
  authorize: (context: UserContext) => ({
    passengerId: { eq: context.req.user.id },
  }),
})
export class PassengerWalletDTO {
  @IDField(() => ID)
  id: number;
  @Field(() => Float)
  balance: number;
  @Field()
  currency: string;
  @FilterableField(() => ID, { filterOnly: true })
  passengerId: number;
}
