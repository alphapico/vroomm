import { Filter } from '@ptc-org/nestjs-query-core';
import {
  CustomAuthorizer,
  AuthorizationContext,
} from '@ptc-org/nestjs-query-graphql';
import { UnauthorizedException } from '@nestjs/common';
import { OperatorPermission } from '@vroom/database/enums/operator-permission.enum';
import { UserContext } from '../auth/authenticated-admin';

export class OperatorAuthorizer implements CustomAuthorizer<any> {
  async authorize(
    context: UserContext,
    authorizerContext: AuthorizationContext
  ): Promise<Filter<any>> {
    if (
      authorizerContext.readonly &&
      !context.req.user.role.permissions.includes(OperatorPermission.Users_View)
    ) {
      throw new UnauthorizedException();
    }
    if (
      !authorizerContext.readonly &&
      !context.req.user.role.permissions.includes(OperatorPermission.Users_Edit)
    ) {
      throw new UnauthorizedException();
    }
    return undefined;
  }
}
