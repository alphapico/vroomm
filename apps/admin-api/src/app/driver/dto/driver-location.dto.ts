import { ObjectType, ID, Int, Field } from '@nestjs/graphql';
import { Point } from '@vroom/database';
import { DriverStatus } from '@vroom/database/enums/driver-status.enum';
import { Gender } from '@vroom/database/enums/gender.enum';

@ObjectType()
export class OnlineDriver {
  @Field(() => Point)
  location: Point;

  @Field(() => ID)
  driverId: number;

  @Field()
  lastUpdatedAt: number;
}

@ObjectType()
export class OnlineDriverWithData {
  @Field(() => ID)
  id: number;

  @Field(() => Point)
  location: Point;

  @Field()
  lastUpdatedAt: number;

  @Field()
  firstName?: string;

  @Field()
  lastName?: string;

  @Field()
  mobileNumber: string;

  @Field(() => DriverStatus)
  status: DriverStatus;

  @Field(() => Gender)
  gender?: Gender;

  @Field(() => Int)
  rating?: number;

  @Field(() => Int)
  reviewCount: number;
}
