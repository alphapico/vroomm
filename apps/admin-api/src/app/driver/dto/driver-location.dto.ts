import { ObjectType, ID, Int, Field, Float } from '@nestjs/graphql';
import { Point } from '@vroom/database';
import { DriverStatus } from '@vroom/database/enums/driver-status.enum';
import { Gender } from '@vroom/database/enums/gender.enum';

@ObjectType()
export class OnlineDriver {
  @Field(() => Point)
  location: Point;

  @Field(() => ID)
  driverId: number;

  @Field(() => Float)
  lastUpdatedAt: number;
}

@ObjectType()
export class OnlineDriverWithData {
  @Field(() => ID)
  id: number;

  @Field(() => Point)
  location: Point;

  @Field(() => Float)
  lastUpdatedAt: number;

  @Field({ nullable: true })
  firstName?: string;

  @Field({ nullable: true })
  lastName?: string;

  @Field()
  mobileNumber: string;

  @Field(() => DriverStatus)
  status: DriverStatus;

  @Field(() => Gender, { nullable: true })
  gender?: Gender;

  @Field(() => Float, { nullable: true })
  rating?: number;

  @Field(() => Float)
  reviewCount: number;
}
