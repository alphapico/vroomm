import { Authorize } from '@ptc-org/nestjs-query-graphql';
import { Field, ID, InputType } from '@nestjs/graphql';
import { OperatorAuthorizer } from '../operator.authorizer';

@InputType()
@Authorize(OperatorAuthorizer)
export class CreateOperatorInput {
  @Field({ nullable: true })
  firstName?: string;

  @Field({ nullable: true })
  lastName?: string;

  @Field()
  userName!: string;

  @Field()
  password!: string;

  @Field()
  mobileNumber!: string;

  @Field({ nullable: true })
  email?: string;

  @Field(() => ID)
  roleId!: number;
}
