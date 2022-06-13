import { IDField } from '@ptc-org/nestjs-query-graphql';
import { ID, ObjectType } from '@nestjs/graphql';
import { OrderActivityType } from '@vroom/database/enums/order-activity-type.enum';

@ObjectType('OrderActivity')
export class OrderActivityDTO {
  @IDField(() => ID)
  id!: number;
  createdAt: Date;
  type: OrderActivityType;
}
