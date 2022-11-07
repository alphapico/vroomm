import {
  Authorize,
  FilterableField,
  IDField,
} from '@ptc-org/nestjs-query-graphql';
import {
  Field,
  Float,
  GraphQLTimestamp,
  ID,
  ObjectType,
} from '@nestjs/graphql';
import { PassengerDeductTransactionType } from '@vroom/database/enums/passenger-deduct-transaction-type.enum';
import { PassengerRechargeTransactionType } from '@vroom/database/enums/passenger-recharge-transaction-type.enum';
import { TransactionAction } from '@vroom/database/enums/transaction-action.enum';

import { UserContext } from '../../auth/authenticated-user';

@ObjectType('PassengerTransacion')
@Authorize({
  authorize: (context: UserContext) => ({
    passengerId: { eq: context.req.user.id },
  }),
})
export class PassengerTransactionDTO {
  @IDField(() => ID)
  id: number;
  @Field(() => GraphQLTimestamp)
  createdAt: number;
  @Field(() => TransactionAction)
  action: TransactionAction;
  @Field(() => PassengerDeductTransactionType, { nullable: true })
  deductType?: PassengerDeductTransactionType;
  @Field(() => PassengerRechargeTransactionType, { nullable: true })
  rechargeType?: PassengerRechargeTransactionType;
  @Field(() => Float)
  amount!: number;
  @Field()
  currency: string;
  @Field({ nullable: true })
  refrenceNumber?: string;
  @FilterableField(() => ID, { filterOnly: true })
  @Field(() => ID)
  passengerId: number;
}
