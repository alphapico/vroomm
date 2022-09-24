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

  @Field(() => DriverDeductTransactionType, { nullable: true })
  deductType?: DriverDeductTransactionType;

  @Field(() => DriverRechargeTransactionType, { nullable: true })
  rechargeType?: DriverRechargeTransactionType;

  @Field(() => Float)
  amount: number;

  @Field()
  currency: string;

  @Field({ nullable: true })
  refrenceNumber?: string;

  @FilterableField(() => ID)
  driverId!: number;

  @Field(() => ID, { nullable: true })
  paymentGatewayId?: number;

  @Field(() => ID, { nullable: true })
  operatorId?: number;

  @Field(() => ID, { nullable: true })
  orderId?: number;

  @Field({ nullable: true })
  description?: string;
}
