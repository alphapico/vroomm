import { registerEnumType } from '@nestjs/graphql';

export enum OrderStatus {
  Requested = 'Requested',
  NotFound = 'NotFound',
  NoCloseFound = 'NoCloseFound',
  Found = 'Found',
  DriverAccepted = 'DriverAccepted',
  Arrived = 'Arrived',
  WaitingForPrePay = 'WaitingForPrePay',
  DriverCanceled = 'DriverCanceled',
  PassengerCanceled = 'PassengerCanceled',
  Started = 'Started',
  WaitingForPostPay = 'WaitingForPostPay',
  WaitingForReview = 'WaitingForReview',
  Finished = 'Finished',
  Booked = 'Booked',
  Expired = 'Expired',
}

registerEnumType(OrderStatus, { name: 'OrderStatus' });
