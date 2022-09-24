import { Field, ID, ObjectType } from '@nestjs/graphql';
import { IDField } from '@ptc-org/nestjs-query-graphql';
import { MessageStatus } from '@vroom/database/enums/message-status.enum';

@ObjectType('OrderMessage')
export class OrderMessageDTO {
  @IDField(() => ID)
  id!: number;
  @Field()
  sentAt: Date;
  @Field()
  sentByDriver: boolean;
  @Field(() => MessageStatus)
  status: MessageStatus;
  @Field()
  content: string;
}
