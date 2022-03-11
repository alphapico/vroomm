import { InputType, ObjectType, Field } from '@nestjs/graphql';

@InputType('DistanceMultiplierInput')
@ObjectType()
export class DistanceMultiplier {
  @Field()
  distanceFrom!: number;

  @Field()
  distanceTo!: number;

  @Field()
  multiply!: number;
}
