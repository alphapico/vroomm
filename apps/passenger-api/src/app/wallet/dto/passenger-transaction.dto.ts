import {
  Authorize,
  FilterableField,
  IDField,
} from '@ptc-org/nestjs-query-graphql';
import { Field, GraphQLTimestamp, ID, ObjectType } from '@nestjs/graphql';
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
  action: TransactionAction;
  deductType?: PassengerDeductTransactionType;
  rechargeType?: PassengerRechargeTransactionType;
  amount!: number;
  currency: string;
  refrenceNumber?: string;
  @FilterableField(() => ID, { filterOnly: true })
  passengerId: number;
}
