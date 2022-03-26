import { registerEnumType } from '@nestjs/graphql';

export enum PassengerDocumentType {
  ID = 'ID',
  Passport = 'Passport',
  DriverLicense = 'DriverLicense',
  ResidentPermitID = 'ResidentPermitID',
}

registerEnumType(PassengerDocumentType, { name: 'PassengerDocumentType' });
