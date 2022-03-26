import { Inject, UseGuards } from '@nestjs/common';
import { CONTEXT, Resolver } from '@nestjs/graphql';
import { UserContext } from '../auth/authenticated-admin';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';

@Resolver()
@UseGuards(JwtAuthGuard)
export class PassengerResolver {
  constructor(
    @Inject(CONTEXT)
    private context: UserContext
  ) {}
}
