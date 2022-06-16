import { registerEnumType } from '@nestjs/graphql';

export enum AnnouncementUserType {
  Driver = 'Driver',
  Passenger = 'Passenger',
  Operator = 'Operator',
}

registerEnumType(AnnouncementUserType, { name: 'AnnouncementUserType' });
