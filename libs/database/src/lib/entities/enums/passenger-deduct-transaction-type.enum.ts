import { registerEnumType } from '@nestjs/graphql';

export enum PassengerDeductTransactionType {
  OrderFee = 'OrderFee',
  Withdraw = 'Withdraw',
  Correction = 'Correction',
}

registerEnumType(PassengerDeductTransactionType, {
  name: 'PassengerDeductTransactionType',
});
