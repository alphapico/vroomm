import { Field, Float, InputType, Int } from '@nestjs/graphql';
import { OrderStatus } from '@vroom/database/enums/order-status.enum';

@InputType()
export class UpdateOrderInput {
  @Field(() => OrderStatus, { nullable: true })
  status?: OrderStatus;
  @Field(() => Float, { nullable: true })
  tipAmount?: number;
  @Field(() => Int, { nullable: true })
  waitMinutes?: number;
  @Field({ nullable: true })
  couponCode?: string;
}
