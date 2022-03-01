import { Authorize, IDField } from '@ptc-org/nestjs-query-graphql';
import { ID, ObjectType } from '@nestjs/graphql';
import { OperatorPermission } from '@vroom/database/enums/operator-permission.enum';
// import { OperatorAuthorizer } from "./operator.authorizer";

@ObjectType('OperatorRole')
// @Authorize(OperatorAuthorizer)
export class OperatorRoleDTO {
  @IDField(() => ID)
  id!: number;
  title!: string;
  permissions: OperatorPermission[];
}
