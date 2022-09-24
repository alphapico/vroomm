import { Authorize, IDField } from '@ptc-org/nestjs-query-graphql';
import { Field, ID, ObjectType } from '@nestjs/graphql';
import { OperatorAuthorizer } from '../operator.authorizer';

@ObjectType('Operator')
@Authorize(OperatorAuthorizer)
export class OperatorDTO {
  @IDField(() => ID)
  id!: number;

  @Field({ nullable: true })
  firstName?: string;

  @Field({ nullable: true })
  lastName?: string;

  @Field()
  userName!: string;

  @Field({ nullable: true })
  mobileNumber?: string;

  @Field({ nullable: true })
  email?: string;

  @Field(() => ID, { nullable: true })
  roleId?: number;
}
