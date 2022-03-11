import { Filter } from '@ptc-org/nestjs-query-core';
import {
  CustomAuthorizer,
  AuthorizationContext,
} from '@ptc-org/nestjs-query-graphql';
import { Injectable, UnauthorizedException } from '@nestjs/common';
import { OperatorPermission } from '@vroom/database/enums/operator-permission.enum';
import { UserContext } from '../../auth/authenticated-admin';

@Injectable()
export class RegionAuthorizer implements CustomAuthorizer<any> {
  async authorize(
    context: UserContext,
    authorizerContext: AuthorizationContext
  ): Promise<Filter<any>> {
    if (
      authorizerContext.readonly &&
      !context.req.user.role.permissions.includes(
        OperatorPermission.Regions_View
      )
    ) {
      throw new UnauthorizedException();
    }
    if (
      !authorizerContext.readonly &&
      !context.req.user.role.permissions.includes(
        OperatorPermission.Regions_Edit
      )
    ) {
      throw new UnauthorizedException();
    }
    return undefined;
  }
}
