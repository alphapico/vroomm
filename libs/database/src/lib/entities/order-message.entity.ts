import {
  Column,
  CreateDateColumn,
  Entity,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { MessageStatus } from './enums/message-status.enum';
import { OrderEntity } from './order.entity';

@Entity('order_chat')
export class OrderMessageEntity {
  @PrimaryGeneratedColumn()
  id!: number;

  @CreateDateColumn()
  sentAt!: Date;

  @Column()
  sentByDriver!: boolean;

  @Column('enum', {
    name: 'state',
    enum: MessageStatus,
    default: MessageStatus.Sent,
  })
  status!: MessageStatus;

  @Column()
  content!: string;

  @ManyToOne(() => OrderEntity, (order) => order.conversation)
  order!: OrderEntity;

  @Column()
  orderId!: number;
}
