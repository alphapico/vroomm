import { ObjectType, Field } from '@nestjs/graphql';
import { CalculateFareError } from './calculate-fare.dto';
import { CreateOrderError } from './create-order-error.dto';

@ObjectType('APIErrors')
export class APIErrors {
  @Field(() => CalculateFareError)
  calculateFare: CalculateFareError;
  createOrder: CreateOrderError;
}
