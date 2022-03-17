import { FilterableField, Relation } from '@ptc-org/nestjs-query-graphql';
import { Field, ID, ObjectType, Float } from '@nestjs/graphql';
import { DriverDeductTransactionType } from '@vroom/database/enums/driver-deduct-transaction-type.enum';
import { DriverRechargeTransactionType } from '@vroom/database/enums/driver-recharge-transaction-type.enum';
import { TransactionAction } from '@vroom/database/enums/transaction-action.enum';
import { TransactionStatus } from '@vroom/database/enums/transaction-status.enum';
import { OperatorDTO } from '../../operator/dto/operator.dto';

@ObjectType('DriverTransaction')
@Relation('operator', () => OperatorDTO, { nullable: true })
export class DriverTransactionDTO {
  @FilterableField()
  createdAt: Date;

  @Field(() => TransactionAction)
  action: TransactionAction;

  @Field(() => TransactionStatus)
  status: TransactionStatus;

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

  @FilterableField(() => ID)
  driverId!: number;

  @Field(() => ID)
  paymentGatewayId?: number;

  @Field(() => ID)
  operatorId?: number;

  @Field(() => ID)
  requestId?: number;

  @Field()
  description?: string;
}
