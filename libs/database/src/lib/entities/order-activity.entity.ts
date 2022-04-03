import {
  Column,
  CreateDateColumn,
  Entity,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { OrderActivityType } from './enums/order-activity-type.enum';
import { OrderEntity } from './order.entity';

@Entity('order_activity')
export class OrderActivityEntity {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column('enum', {
    enum: OrderActivityType,
  })
  type!: OrderActivityType;

  @CreateDateColumn()
  createdAt!: Date;

  @ManyToOne(() => OrderEntity, (order) => order.activities)
  order!: OrderEntity;

  @Column()
  orderId!: number;
}
