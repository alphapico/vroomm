import {
  FilterableField,
  IDField,
  Relation,
} from '@ptc-org/nestjs-query-graphql';
import { Float, ID, ObjectType, Field } from '@nestjs/graphql';
import { PassengerDTO } from './passenger.dto';

@ObjectType('PassengerWallet')
@Relation('passenger', () => PassengerDTO)
export class PassengerWalletDTO {
  @IDField(() => ID)
  id: number;

  @FilterableField(() => Float)
  balance: number;

  @Field()
  currency: string;

  @FilterableField(() => ID)
  passengerId: number;
}
