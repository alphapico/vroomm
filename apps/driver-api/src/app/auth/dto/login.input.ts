import { InputType, Field } from '@nestjs/graphql';

@InputType()
export class LoginInput {
  @Field()
  firebaseToken: string;
}
