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

  @Field()
  firstName?: string;

  @FilterableField(() => String)
  lastName?: string;

  @FilterableField(() => String, { middleware: [numberMasker] })
  mobileNumber: string;

  @Field()
  certificateNumber?: string;

  @Field()
  email?: string;

  @Field(() => Int)
  carProductionYear?: number;

  @Field(() => ID)
  carId?: number;

  @Field(() => ID)
  carColorId?: number;

  @Field()
  carPlate?: string;

  @FilterableField(() => DriverStatus)
  status!: DriverStatus;

  @Field(() => Gender)
  gender?: Gender;

  @Field(() => Int)
  rating?: number;

  @Field(() => Int)
  reviewCount: number;

  @Field()
  registrationTimestamp!: Date;

  @Field()
  lastSeenTimestamp?: Date;

  @Field()
  accountNumber?: string;

  @Field()
  bankName?: string;

  @Field()
  bankRoutingNumber?: string;

  @Field()
  bankSwift?: string;

  @Field()
  address?: string;

  @Field()
  softRejectionNote?: string;

  @Field(() => ID)
  mediaId?: number;
}
