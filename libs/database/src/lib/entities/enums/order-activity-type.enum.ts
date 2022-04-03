import { registerEnumType } from '@nestjs/graphql';

export enum OrderActivityType {
  RequestedByOperator = 'RequestedByOperator',
  BookedByOperator = 'BookedByOperator',
  RequestedByPassenger = 'RequestedByPassenger',
  BookedByPassenger = 'BookedByPassenger',
  DriverAccepted = 'DriverAccepted',
  ArrivedToPickupPoint = 'ArrivedToPickupPoint',
  CanceledByDriver = 'CanceledByDriver',
  CanceledByPassenger = 'CanceledByPassenger',
  CanceledByOperator = 'CanceledByOperator',
  Started = 'Started',
  ArrivedToDestination = 'ArrivedToDestination',
  Paid = 'Paid',
  Reviewed = 'Reviewed',
  Expired = 'Expired',
}

registerEnumType(OrderActivityType, { name: 'OrderActivityType' });
