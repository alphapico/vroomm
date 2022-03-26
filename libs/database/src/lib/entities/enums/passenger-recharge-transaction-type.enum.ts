import { registerEnumType } from '@nestjs/graphql';

export enum PassengerRechargeTransactionType {
  BankTransfer = 'BankTransfer',
  Gift = 'Gift',
  Correction = 'Correction',
  InAppPayment = 'InAppPayment',
}

registerEnumType(PassengerRechargeTransactionType, {
  name: 'PassengerRechargeTransactionType',
});
