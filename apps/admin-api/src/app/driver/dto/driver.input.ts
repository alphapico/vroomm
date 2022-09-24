import { Field, ID, Int, InputType } from '@nestjs/graphql';
import { DriverStatus } from '@vroom/database/enums/driver-status.enum';
import { Gender } from '@vroom/database/enums/gender.enum';

@InputType()
export class UpdateDriverInput {
  @Field(() => ID, { nullable: true })
  carId?: number;

  @Field(() => ID, { nullable: true })
  carColorId?: number;

  @Field({ nullable: true })
  firstName?: string;

  @Field({ nullable: true })
  lastName?: string;

  @Field({ nullable: true })
  certificateNumber?: string;

  @Field({ nullable: true })
  email?: string;

  @Field(() => Int, { nullable: true })
  carProductionYear?: number;

  @Field({ nullable: true })
  carPlate?: string;

  @Field(() => DriverStatus, { nullable: true })
  status?: DriverStatus;

  @Field(() => Gender, { nullable: true })
  gender?: Gender;

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
