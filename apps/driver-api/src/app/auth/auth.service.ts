import { FirebaseAuthenticationService } from '@vroom/nestjs-firebase-admin';
import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { DriverEntity } from '@vroom/database/driver.entity';

@Injectable()
export class AuthService {
  constructor(
    private jwtService: JwtService,
    private firebaseAuth: FirebaseAuthenticationService
  ) {}

  async loginUser(user: DriverEntity): Promise<TokenObject> {
    const payload = { id: user.id };
    return {
      token: this.jwtService.sign(payload),
    };
  }
}

export type TokenObject = { token: string };
