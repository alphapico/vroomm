import { Field, ID, Int, InputType } from '@nestjs/graphql';
import { DriverStatus } from '@vroom/database/enums/driver-status.enum';
import { Gender } from '@vroom/database/enums/gender.enum';

@InputType()
export class UpdateDriverInput {
  @Field(() => ID)
  carId?: number;

  @Field(() => ID)
  carColorId?: number;

  @Field()
  firstName?: string;

  @Field()
  lastName?: string;

  @Field()
  certificateNumber?: string;

  @Field()
  email?: string;

  @Field(() => Int)
  carProductionYear?: number;

  @Field()
  carPlate?: string;

  @Field(() => DriverStatus)
  status?: DriverStatus;

  @Field(() => Gender)
  gender?: Gender;

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
