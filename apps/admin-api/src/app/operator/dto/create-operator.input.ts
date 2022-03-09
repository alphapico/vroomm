import { Authorize } from '@ptc-org/nestjs-query-graphql';
import { Field, ID, InputType } from '@nestjs/graphql';
import { OperatorAuthorizer } from '../operator.authorizer';

@InputType()
@Authorize(OperatorAuthorizer)
export class CreateOperatorInput {
  @Field()
  firstName?: string;

  @Field()
  lastName?: string;

  @Field()
  userName!: string;

  @Field()
  password!: string;

  @Field()
  mobileNumber!: string;

  @Field()
  email?: string;

  @Field(() => ID)
  roleId!: number;
}
