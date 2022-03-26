import { Field, ID, InputType, Float } from '@nestjs/graphql';
import { PassengerDeductTransactionType } from '@vroom/database/enums/passenger-deduct-transaction-type.enum';
import { PassengerRechargeTransactionType } from '@vroom/database/enums/passenger-recharge-transaction-type.enum';
import { TransactionAction } from '@vroom/database/enums/transaction-action.enum';

@InputType()
export class PassengerTransactionInput {
  @Field(() => TransactionAction)
  action: TransactionAction;

  @Field(() => PassengerDeductTransactionType)
  deductType?: PassengerDeductTransactionType;

  @Field(() => PassengerRechargeTransactionType)
  rechargeType?: PassengerRechargeTransactionType;

  @Field(() => Float)
  amount: number;

  @Field()
  currency: string;

  @Field()
  refrenceNumber?: string;

  @Field()
  description?: string;

  @Field(() => ID)
  passengerId!: number;
}
