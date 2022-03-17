import { Field, ID, Float, InputType } from '@nestjs/graphql';
import { DriverDeductTransactionType } from '@vroom/database/enums/driver-deduct-transaction-type.enum';
import { DriverRechargeTransactionType } from '@vroom/database/enums/driver-recharge-transaction-type.enum';
import { TransactionAction } from '@vroom/database/enums/transaction-action.enum';

@InputType()
export class DriverTransactionInput {
  @Field(() => TransactionAction)
  action: TransactionAction;

  @Field(() => DriverDeductTransactionType)
  deductType?: DriverDeductTransactionType;

  @Field(() => DriverRechargeTransactionType)
  rechargeType?: DriverRechargeTransactionType;

  @Field(() => Float)
  amount: number;

  @Field()
  currency: string;

  @Field()
  refrenceNumber?: string;

  @Field(() => ID)
  driverId!: number;

  @Field()
  description?: string;
}
