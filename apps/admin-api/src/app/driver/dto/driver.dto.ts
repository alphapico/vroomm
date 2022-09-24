import {
  FilterableField,
  IDField,
  OffsetConnection,
  Relation,
  UnPagedRelation,
} from '@ptc-org/nestjs-query-graphql';
import { Field, ID, Int, ObjectType } from '@nestjs/graphql';
import { DriverStatus } from '@vroom/database/enums/driver-status.enum';
import { Gender } from '@vroom/database/enums/gender.enum';
import { FeedbackDTO } from '../../feedback/dto/feedback.dto';
import { numberMasker } from '../../number.masker.middleware';
import { ServiceDTO } from '../../service/dto/service.dto';
import { MediaDTO } from '../../upload/media.dto';
import { DriverTransactionDTO } from './driver-transaction.dto';
import { DriverWalletDTO } from './driver-wallet.dto';

@ObjectType('Driver')
@OffsetConnection('feedbacks', () => FeedbackDTO, { enableAggregate: true })
@UnPagedRelation('wallet', () => DriverWalletDTO, { relationName: 'wallet' })
@UnPagedRelation('enabledServices', () => ServiceDTO)
@UnPagedRelation('documents', () => MediaDTO)
@OffsetConnection('transactions', () => DriverTransactionDTO)
@Relation('media', () => MediaDTO, { nullable: true })
export class DriverDTO {
  @IDField(() => ID)
  id!: number;

  @Field({ nullable: true })
  firstName?: string;

  @FilterableField(() => String, { nullable: true })
  lastName?: string;

  @FilterableField(() => String, { middleware: [numberMasker] })
  mobileNumber: string;

  @Field({ nullable: true })
  certificateNumber?: string;

  @Field({ nullable: true })
  email?: string;

  @Field(() => Int, { nullable: true })
  carProductionYear?: number;

  @Field(() => ID, { nullable: true })
  carId?: number;

  @Field(() => ID, { nullable: true })
  carColorId?: number;

  @Field({ nullable: true })
  carPlate?: string;

  @FilterableField(() => DriverStatus)
  status!: DriverStatus;

  @Field(() => Gender, { nullable: true })
  gender?: Gender;

  @Field(() => Int, { nullable: true })
  rating?: number;

  @Field(() => Int)
  reviewCount: number;

  @Field()
  registrationTimestamp!: Date;

  @Field({ nullable: true })
  lastSeenTimestamp?: Date;

  @Field({ nullable: true })
  accountNumber?: string;

  @Field({ nullable: true })
  bankName?: string;

  @Field({ nullable: true })
  bankRoutingNumber?: string;

  @Field({ nullable: true })
  bankSwift?: string;

  @Field({ nullable: true })
  address?: string;

  @Field({ nullable: true })
  softRejectionNote?: string;

  @Field(() => ID, { nullable: true })
  mediaId?: number;
}
