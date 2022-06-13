import { ID, ObjectType } from '@nestjs/graphql';
import { IDField } from '@ptc-org/nestjs-query-graphql';
import { MessageStatus } from '@vroom/database/enums/message-status.enum';

@ObjectType('OrderMessage')
export class OrderMessageDTO {
  @IDField(() => ID)
  id!: number;
  sentAt: Date;
  sentByDriver: boolean;
  status: MessageStatus;
  content: string;
}
