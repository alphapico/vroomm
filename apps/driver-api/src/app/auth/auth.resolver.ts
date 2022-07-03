import { FirebaseAuthenticationService } from '@vroom/nestjs-firebase-admin';
import { Args, CONTEXT, Int, Mutation, Query, Resolver } from '@nestjs/graphql';
import { JwtService } from '@nestjs/jwt';

import { LoginDTO } from './dto/login.dto';
import { LoginInput } from './dto/login.input';
import { VersionStatus } from '@vroom/database/enums/version-status.enum';
import { Inject, UseGuards } from '@nestjs/common';
import { GqlAuthGuard } from './jwt-gql-auth.guard';
import { UserContext } from './authenticated-user';

@Resolver()
export class AuthResolver {
  constructor(
    private firebaseAuth: FirebaseAuthenticationService,
    private jwtService: JwtService,
    @Inject(CONTEXT)
    private userContext: UserContext
  ) {}

  @Query(() => VersionStatus)
  async requireUpdate(
    @Args('versionCode', { type: () => Int }) versionCode: number
  ) {
    if (
      process.env.MANDATORY_VERSION_CODE != null &&
      versionCode < parseInt(process.env.MANDATORY_VERSION_CODE)
    ) {
      return VersionStatus.MandatoryUpdate;
    }
    if (
      process.env.OPTIONAL_VERSION_CODE != null &&
      versionCode < parseInt(process.env.OPTIONAL_VERSION_CODE)
    ) {
      return VersionStatus.OptionalUpdate;
    }
    return VersionStatus.Latest;
  }
}
