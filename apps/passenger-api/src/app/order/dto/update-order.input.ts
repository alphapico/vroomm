import { Field, InputType, Int } from '@nestjs/graphql';
import { OrderStatus } from '@vroom/database/enums/order-status.enum';

@InputType()
export class UpdateOrderInput {
  status?: OrderStatus;
  tipAmount?: number;
  @Field(() => Int, { nullable: true })
  waitMinutes?: number;
  couponCode?: string;
}
