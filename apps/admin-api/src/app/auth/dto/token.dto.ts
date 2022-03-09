import { Field, ObjectType } from '@nestjs/graphql';

@ObjectType()
export class TokenObject {
  @Field()
  token: string;
}
