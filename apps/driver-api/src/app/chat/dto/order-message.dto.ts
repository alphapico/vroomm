import {
  FilterableField,
  IDField,
  Relation,
} from '@ptc-org/nestjs-query-graphql';
import { Field, ID, ObjectType } from '@nestjs/graphql';
import { MessageStatus } from '@vroom/database/enums/message-status.enum';
import { OrderDTO } from '../../order/dto/order.dto';

@ObjectType('OrderMessage')
@Relation('order', () => OrderDTO, {
  disableRemove: true,
  disableUpdate: true,
})
export class OrderMessageDTO {
  @IDField(() => ID)
  id: number;
  @Field()
  sentAt: Date;
  @Field(() => MessageStatus)
  status: MessageStatus;
  @Field()
  content: string;
  @Field()
  sentByDriver: boolean;
  @FilterableField(() => ID)
  orderId: number;
}
