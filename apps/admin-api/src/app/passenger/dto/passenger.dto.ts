import {
  FilterableField,
  IDField,
  OffsetConnection,
  Relation,
} from '@ptc-org/nestjs-query-graphql';
import { ID, Int, ObjectType, Field } from '@nestjs/graphql';
import { Gender } from '@vroom/database/enums/gender.enum';
import { PassengerStatus } from '@vroom/database/enums/passenger-status.enum';
import { numberMasker } from '../../number.masker.middleware';
import { MediaDTO } from '../../upload/media.dto';
import { PassengerAddressDTO } from './passenger-address.dto';
import { PassengerTransactionDTO } from './passenger-transaction.dto';
import { PassengerWalletDTO } from './passenger-wallet.dto';

@ObjectType('Passenger')
@OffsetConnection('addresses', () => PassengerAddressDTO)
@OffsetConnection('wallet', () => PassengerWalletDTO)
@OffsetConnection('transactions', () => PassengerTransactionDTO)
@Relation('media', () => MediaDTO, { nullable: true })
export class PassengerDTO {
  @IDField(() => ID)
  id!: number;

  @Field(() => PassengerStatus)
  status: PassengerStatus;

  @FilterableField({ nullable: true })
  firstName?: string;

  @FilterableField({ nullable: true })
  lastName?: string;

  @FilterableField(() => String, { middleware: [numberMasker] })
  mobileNumber: string;

  @Field()
  registrationTimestamp: Date;

  @Field({ nullable: true })
  email?: string;

  @FilterableField(() => Gender, { nullable: true })
  gender?: Gender;

  @Field({ nullable: true })
  isResident?: boolean;

  @Field({ nullable: true })
  idNumber?: string;
}
