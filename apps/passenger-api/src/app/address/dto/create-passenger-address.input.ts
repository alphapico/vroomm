import {
  BeforeCreateOne,
  CreateOneInputType,
} from '@ptc-org/nestjs-query-graphql';
import { Logger } from '@nestjs/common';
import { InputType, Field } from '@nestjs/graphql';
import { Point } from '@vroom/database';
import { PassengerAddressType } from '@vroom/database/enums/passenger-address-type.enum';
import { UserContext } from '../../auth/authenticated-user';

@InputType()
@BeforeCreateOne(
  (
    input: CreateOneInputType<CreatePassengerAddressInput>,
    context: UserContext
  ) => {
    return { input: { ...input.input, passengerId: context.req.user.id } };
  }
)
export class CreatePassengerAddressInput {
  @Field()
  title: string;
  details: string;
  location: Point;
  type?: PassengerAddressType;
}
