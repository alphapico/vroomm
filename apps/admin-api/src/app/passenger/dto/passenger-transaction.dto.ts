import {
  FilterableField,
  IDField,
  Relation,
} from '@ptc-org/nestjs-query-graphql';
import { Field, Float, ID, ObjectType } from '@nestjs/graphql';
import { PassengerDeductTransactionType } from '@vroom/database/enums/passenger-deduct-transaction-type.enum';
import { PassengerRechargeTransactionType } from '@vroom/database/enums/passenger-recharge-transaction-type.enum';
import { TransactionAction } from '@vroom/database/enums/transaction-action.enum';
import { TransactionStatus } from '@vroom/database/enums/transaction-status.enum';

import { OperatorDTO } from '../../operator/dto/operator.dto';
import { PassengerDTO } from './passenger.dto';

@ObjectType('PassengerTransaction')
@Relation('operator', () => OperatorDTO, { nullable: true })
@Relation('passenger', () => PassengerDTO)
export class PassengerTransactionDTO {
  @IDField(() => ID)
  id: number;

  @Field(() => TransactionAction)
  action: TransactionAction;

  @FilterableField()
  createdAt: Date;

  @Field(() => PassengerDeductTransactionType)
  deductType?: PassengerDeductTransactionType;

  @Field(() => PassengerRechargeTransactionType)
  rechargeType?: PassengerRechargeTransactionType;

  @Field(() => TransactionStatus)
  status: TransactionStatus;

  @FilterableField(() => Float)
  amount: number;

  @FilterableField(() => String)
  currency: string;

  @Field()
  refrenceNumber?: string;

  @Field()
  description?: string;

  @FilterableField(() => ID)
  passengerId!: number;

  @Field(() => ID)
  operatorId?: number;

  @Field(() => ID)
  orderId?: number;
}
