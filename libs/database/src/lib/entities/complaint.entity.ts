import {
  Column,
  CreateDateColumn,
  Entity,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { ComplaintActivityEntity } from './complaint-activity.entity';
import { ComplaintStatus } from './enums/complaint-status.enum';
import { OrderEntity } from './order.entity';

@Entity('complaint')
export class ComplaintEntity {
  @PrimaryGeneratedColumn()
  id!: number;

  @CreateDateColumn()
  inscriptionTimestamp!: Date;

  @ManyToOne(() => OrderEntity, (order) => order.complaints)
  order!: OrderEntity;

  @Column()
  orderId!: number;

  @Column()
  requestedByDriver!: boolean;

  @Column()
  subject!: string;

  @Column({ nullable: true })
  content?: string;

  @Column('enum', {
    enum: ComplaintStatus,
    default: ComplaintStatus.Submitted,
  })
  status!: ComplaintStatus;

  @OneToMany(() => ComplaintActivityEntity, (activity) => activity.complaint)
  activities!: ComplaintActivityEntity[];
}
