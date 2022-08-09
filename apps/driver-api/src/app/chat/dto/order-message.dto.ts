import {
  FilterableField,
  IDField,
  Relation,
} from '@ptc-org/nestjs-query-graphql';
import { ID, ObjectType } from '@nestjs/graphql';
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
  sentAt: Date;
  status: MessageStatus;
  content: string;
  sentByDriver: boolean;
  @FilterableField(() => ID)
  orderId: number;
}
