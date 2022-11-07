import {
  Authorize,
  BeforeFindOne,
  FilterableField,
  FindOneArgsType,
  IDField,
} from '@ptc-org/nestjs-query-graphql';
import { Field, ID, ObjectType } from '@nestjs/graphql';
import { Point } from '@vroom/database';
import { PassengerAddressType } from '@vroom/database/enums/passenger-address-type.enum';
import { UserContext } from '../../auth/authenticated-user';

@ObjectType('PassengerAddress')
@Authorize({
  authorize: (context: UserContext) => ({
    passengerId: { eq: context.req.user.id },
  }),
})
export class PassengerAddressDTO {
  @IDField(() => ID)
  id: number;
  @Field(() => PassengerAddressType)
  type: PassengerAddressType;
  @Field()
  title: string;
  @Field(() => Point)
  details: Point;
  @Field(() => Point)
  location: Point;
  @FilterableField(() => ID, { filterOnly: true })
  passengerId: number;
}
