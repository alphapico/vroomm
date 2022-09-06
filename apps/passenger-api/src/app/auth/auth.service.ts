import { FirebaseAuthenticationService } from '@vroom/nestjs-firebase-admin';
import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { PassengerEntity } from '@vroom/database/passenger.entity';
import { SharedPassengerService } from '@vroom/order/shared-passenger.service';

@Injectable()
export class AuthService {
  constructor(
    private passengerService: SharedPassengerService,
    private jwtService: JwtService,
    private firebaseAuth: FirebaseAuthenticationService
  ) {}

  async validateUser(firebaseToken: string): Promise<PassengerEntity> {
    const decodedToken = await this.firebaseAuth.app
      .auth()
      .verifyIdToken(firebaseToken);
    const number = (
      decodedToken.firebase.identities.phone[0] as string
    ).substring(1);
    const user = await this.passengerService.findOrCreateUserWithMobileNumber(
      number
    );
    return user;
  }

  async loginUser(user: PassengerEntity): Promise<TokenObject> {
    const payload = { id: user.id };
    return {
      token: this.jwtService.sign(payload),
    };
  }
}

export type TokenObject = { token: string };
