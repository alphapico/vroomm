import {
  Authorize,
  FilterableField,
  IDField,
} from '@ptc-org/nestjs-query-graphql';
import { Field, Float, ID, ObjectType } from '@nestjs/graphql';
import { DriverDeductTransactionType } from '@vroom/database/enums/driver-deduct-transaction-type.enum';
import { DriverRechargeTransactionType } from '@vroom/database/enums/driver-recharge-transaction-type.enum';
import { TransactionAction } from '@vroom/database/enums/transaction-action.enum';

import { UserContext } from '../../auth/authenticated-user';

@ObjectType('DriverTransacion')
@Authorize({
  authorize: (context: UserContext) => ({
    driverId: { eq: context.req.user.id },
  }),
})
export class DriverTransactionDTO {
  @IDField(() => ID)
  id: number;
  @Field()
  createdAt: Date;
  @IDField(() => TransactionAction)
  action: TransactionAction;
  @IDField(() => DriverDeductTransactionType, { nullable: true })
  deductType?: DriverDeductTransactionType;
  @IDField(() => DriverRechargeTransactionType, { nullable: true })
  rechargeType?: DriverRechargeTransactionType;
  @IDField(() => Float)
  amount!: number;
  @Field()
  currency: string;
  @Field({ nullable: true })
  refrenceNumber?: string;
  @FilterableField(() => ID, { filterOnly: true })
  driverId: number;
}
