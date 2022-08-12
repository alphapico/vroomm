import { FirebaseAuthenticationService } from '@vroom/nestjs-firebase-admin';
import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { PassengerEntity } from '@vroom/database/passenger.entity';

@Injectable()
export class AuthService {
  constructor(
    private jwtService: JwtService,
    private firebaseAuth: FirebaseAuthenticationService
  ) {}

  async loginUser(user: PassengerEntity): Promise<TokenObject> {
    const payload = { id: user.id };
    return {
      token: this.jwtService.sign(payload),
    };
  }
}

export type TokenObject = { token: string };
