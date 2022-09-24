import { Field, ObjectType } from '@nestjs/graphql';
import { CalculateFareError } from './calculate-fare.dto';
import { CreateOrderError } from './create-order-error.dto';

@ObjectType('APIErrors')
export class APIErrors {
  @Field(() => CalculateFareError)
  calculateFare: CalculateFareError;
  @Field(() => CreateOrderError)
  createOrder: CreateOrderError;
}
