import { IDField } from '@ptc-org/nestjs-query-graphql';
import { ID, ObjectType } from '@nestjs/graphql';
import { Point } from 'libs/database/src/lib/interfaces/point';

@ObjectType('Address')
export class AddressDTO {
  @IDField(() => ID)
  id!: number;
  title!: string;
  details?: string;
  location!: Point;
}
