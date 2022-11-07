import { ObjectType, Field } from '@nestjs/graphql';
import { Point } from '@vroom/database';
import { OrderDTO } from './order.dto';

@ObjectType()
export class CurrentOrder {
  @Field(() => OrderDTO)
  order: OrderDTO;
  @Field(() => [Point], { nullable: true })
  driverLocation?: Point;
}
