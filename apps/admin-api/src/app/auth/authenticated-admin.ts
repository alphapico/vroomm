// import { GqlExecutionContext, ObjectType } from '@nestjs/graphql';

import { OperatorEntity } from '@vroom/database/operator.entity';

// @ObjectType('AuthenticatedOperator')
// export class AuthenticatedOperatorDTO {
//   id: number;
// }

// export type UserContext = GqlExecutionContext & {
//   req: { user: AuthenticatedOperatorDTO };
// };

export type AuthenticatedUser = Pick<
  OperatorEntity,
  'id' | 'userName' | 'role'
>;

export type UserContext = {
  req: {
    user: AuthenticatedUser;
  };
};
