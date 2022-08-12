import { GqlExecutionContext, ObjectType } from '@nestjs/graphql';

@ObjectType('AuthenticatedPassenger')
export class AuthenticatedPassengerDTO {
  id: number;
}

export type UserContext = GqlExecutionContext & {
  req: { user: AuthenticatedPassengerDTO };
};
export type UserContextOptional = GqlExecutionContext & {
  req: { user?: AuthenticatedPassengerDTO };
};
