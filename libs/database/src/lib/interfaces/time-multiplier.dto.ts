import { InputType, ObjectType, Field } from '@nestjs/graphql';

@InputType('TimeMultiplierInput')
@ObjectType()
export class TimeMultiplier {
  @Field()
  startTime!: string;

  @Field()
  endTime!: string;

  @Field()
  multiply!: number;
}
