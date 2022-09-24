import { IDField } from '@ptc-org/nestjs-query-graphql';
import { Field, ID, ObjectType } from '@nestjs/graphql';
import { OrderActivityType } from '@vroom/database/enums/order-activity-type.enum';

@ObjectType('OrderActivity')
export class OrderActivityDTO {
  @IDField(() => ID)
  id!: number;
  @Field()
  createdAt: Date;
  @Field(() => OrderActivityType)
  type: OrderActivityType;
}
