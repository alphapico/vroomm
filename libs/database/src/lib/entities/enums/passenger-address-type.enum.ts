import { registerEnumType } from '@nestjs/graphql';

export enum PassengerAddressType {
  Home = 'Home',
  Work = 'Work',
  Partner = 'Partner',
  Gym = 'Gym',
  Parent = 'Parent',
  Cafe = 'Cafe',
  Park = 'Park',
  Other = 'Other',
}

registerEnumType(PassengerAddressType, { name: 'PassengerAddressType' });
