import { Field, ID, InputType, Int } from '@nestjs/graphql';
import { DriverStatus } from '@vroom/database/enums/driver-status.enum';
import { Gender } from '@vroom/database/enums/gender.enum';

@InputType()
export class UpdateDriverInput {
  @Field({ nullable: true })
  firstName?: string;
  @Field({ nullable: true })
  lastName?: string;
  @Field(() => DriverStatus, { nullable: true })
  status?: DriverStatus;
  @Field({ nullable: true })
  certificateNumber?: string;
  @Field({ nullable: true })
  email?: string;
  @Field(() => Int, { nullable: true })
  carProductionYear?: number;
  @Field({ nullable: true })
  carPlate?: string;
  @Field(() => ID, { nullable: true })
  mediaId?: number;
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
  @Field(() => ID, { nullable: true })
  carModelId?: number;
  @Field(() => ID, { nullable: true })
  carColorId?: number;
  @Field({ nullable: true })
  notificationPlayerId?: string;
  @Field(() => Int, { nullable: true })
  searchDistance?: number;
}
