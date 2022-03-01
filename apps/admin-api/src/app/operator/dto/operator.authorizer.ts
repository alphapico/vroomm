// import { Filter } from '@ptc-org/nestjs-query-core';
// import {
//   CustomAuthorizer,
//   AuthorizationContext,
// } from '@ptc-org/nestjs-query-graphql';
// import { Injectable, UnauthorizedException } from '@nestjs/common';
// import { OperatorPermission } from '@vroom/database/enums/operator-permission.enum';
// import { OperatorEntity } from '@vroom/database/operator.entity';
// import { getRepository } from 'typeorm';
// import { UserContext } from '../../auth/authenticated-admin';

// @Injectable()
// export class OperatorAuthorizer implements CustomAuthorizer<any> {
//   async authorize(
//     context: UserContext,
//     authorizerContext: AuthorizationContext
//   ): Promise<Filter<any>> {
//     const operator = await getRepository(OperatorEntity).findOne(
//       context.req.user.id,
//       { relations: ['role'] }
//     );
//     if (
//       authorizerContext.readonly &&
//       !operator.role.permissions.includes(OperatorPermission.Users_View)
//     ) {
//       throw new UnauthorizedException();
//     }
//     if (
//       !authorizerContext.readonly &&
//       !operator.role.permissions.includes(OperatorPermission.Users_Edit)
//     ) {
//       throw new UnauthorizedException();
//     }
//     return undefined;
//   }
// }
