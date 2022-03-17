import {
  FilterableField,
  IDField,
  Relation,
} from '@ptc-org/nestjs-query-graphql';
import { Float, ID, ObjectType } from '@nestjs/graphql';
import { DriverDTO } from './driver.dto';

@ObjectType('DriverWallet')
@Relation('driver', () => DriverDTO)
export class DriverWalletDTO {
  @IDField(() => ID)
  id: number;

  @FilterableField(() => Float)
  balance: number;

  @FilterableField(() => String)
  currency: string;

  @FilterableField(() => ID)
  driverId: number;
}
