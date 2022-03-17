import { Authorize, IDField } from '@ptc-org/nestjs-query-graphql';
import { ID, ObjectType, Field } from '@nestjs/graphql';
import { CarAuthorizer } from './car.authorizer';

@ObjectType('CarColor')
@Authorize(CarAuthorizer)
export class CarColorDTO {
  @IDField(() => ID)
  id: number;

  @Field()
  name: string;
}
