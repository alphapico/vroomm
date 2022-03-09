import { Authorize, IDField } from '@ptc-org/nestjs-query-graphql';
import { Field, ID, ObjectType } from '@nestjs/graphql';
import { OperatorAuthorizer } from '../operator.authorizer';

@ObjectType('Operator')
@Authorize(OperatorAuthorizer)
export class OperatorDTO {
  @IDField(() => ID)
  id!: number;

  @Field()
  firstName?: string;

  @Field()
  lastName?: string;

  @Field()
  userName!: string;

  @Field()
  mobileNumber?: string;

  @Field()
  email?: string;

  @Field(() => ID)
  roleId?: number;
}
