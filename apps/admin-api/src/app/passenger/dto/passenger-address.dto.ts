import { FilterableField, IDField } from '@ptc-org/nestjs-query-graphql';
import { ID, ObjectType, Field } from '@nestjs/graphql';
import { Point } from '@vroom/database';
import { PassengerAddressType } from '@vroom/database/enums/passenger-address-type.enum';

@ObjectType('PassengerAddress')
export class PassengerAddressDTO {
  @IDField(() => ID)
  id: number;

  @Field(() => PassengerAddressType)
  type: PassengerAddressType;

  @Field()
  title: string;

  @Field({ nullable: true })
  details?: string;

  @Field(() => Point)
  location: Point;

  @FilterableField(() => ID)
  passengerId: number;
}
