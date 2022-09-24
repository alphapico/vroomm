import { InputType, Field, Float } from '@nestjs/graphql';
import { OrderStatus } from '@vroom/database/enums/order-status.enum';

@InputType()
export class UpdateOrderInput {
  @Field(() => OrderStatus)
  status: OrderStatus;
  @Field(() => Float, { nullable: true })
  paidAmount?: number;
}
