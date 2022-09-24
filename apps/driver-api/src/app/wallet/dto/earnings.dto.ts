import { ObjectType, Field, registerEnumType, Float } from '@nestjs/graphql';

export enum TimeQuery {
  Daily = 'daily',
  Weekly = 'weekly',
  Monthly = 'monthly',
}

registerEnumType(TimeQuery, { name: 'TimeQuery' });

@ObjectType()
export class StatisticsResult {
  @Field()
  currency: string;
  @Field(() => [Datapoint])
  dataset: Datapoint[];
}

@ObjectType()
export class Datapoint {
  @Field()
  name: string;
  @Field()
  current: string;
  @Field(() => Float)
  earning: number;
  @Field(() => Float)
  count: number;
  @Field(() => Float)
  distance: number;
  @Field(() => Float)
  time: number;
}
