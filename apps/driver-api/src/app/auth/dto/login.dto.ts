import { ObjectType, Field } from '@nestjs/graphql';

@ObjectType('Login')
export class LoginDTO {
  @Field()
  jwtToken: string;
}
