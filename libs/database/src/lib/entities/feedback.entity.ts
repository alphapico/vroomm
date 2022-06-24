import {
  Column,
  CreateDateColumn,
  Entity,
  JoinColumn,
  ManyToMany,
  ManyToOne,
  OneToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { DriverEntity } from './driver.entity';
import { FeedbackParameterEntity } from './feedback-parameter.entity';
import { OrderEntity } from './order.entity';

@Entity('order_review')
export class FeedbackEntity {
  @PrimaryGeneratedColumn()
  id!: number;

  @CreateDateColumn()
  reviewTimestamp!: Date;

  @Column('tinyint')
  score!: number;

  @Column({ name: 'review', nullable: true })
  description?: string;

  @ManyToOne(() => DriverEntity, (driver) => driver.feedbacks)
  driver!: DriverEntity;

  @Column()
  driverId!: number;

  @OneToOne(() => OrderEntity, (order) => order.review)
  order!: OrderEntity;

  @Column()
  orderId!: number;

  @ManyToMany(
    () => FeedbackParameterEntity,
    (feedbackParameter) => feedbackParameter.feedbacks
  )
  parameters!: FeedbackParameterEntity[];
}
