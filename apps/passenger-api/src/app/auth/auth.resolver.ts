import { FirebaseAuthenticationService } from '@vroom/nestjs-firebase-admin';
import { Inject, UseGuards } from '@nestjs/common';
import { Args, CONTEXT, Int, Mutation, Query, Resolver } from '@nestjs/graphql';
import { JwtService } from '@nestjs/jwt';
import { InjectRepository } from '@nestjs/typeorm';
import { VersionStatus } from '@vroom/database/enums/version-status.enum';
import { PassengerEntity } from '@vroom/database/passenger.entity';
import { Repository } from 'typeorm';

// import { PassengerDTO } from '../passenger/dto/passenger.dto';
import { UserContext } from './authenticated-user';
import { LoginDTO } from './dto/login.dto';
import { LoginInput } from './dto/login.input';
import { GqlAuthGuard } from './jwt-gql-auth.guard';

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

  // @Mutation(() => PassengerDTO)
  // @UseGuards(GqlAuthGuard)
  // async deleteUser() {
  //   return this.passengerService.deleteById(this.userContext.req.user.id);
  // }
}
