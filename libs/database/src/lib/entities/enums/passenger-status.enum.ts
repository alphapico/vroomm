import { registerEnumType } from '@nestjs/graphql';

export enum PassengerStatus {
  Enabled = 'enabled',
  Disabled = 'blocked',
}
registerEnumType(PassengerStatus, { name: 'PassengerStatus' });
