import { Column, PrimaryGeneratedColumn } from 'typeorm';
import { Entity } from 'typeorm/decorator/entity/Entity';
import { PaymentStatus } from './enums/payment-status.enum';

@Entity('payment')
export class PaymentEntity {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column('enum', {
    enum: PaymentStatus,
    default: PaymentStatus.Processing,
  })
  status!: PaymentStatus;

  @Column()
  amount!: number;

  @Column()
  currency!: string;

  @Column()
  transactionNumber!: string;

  @Column()
  userType!: string;

  @Column()
  userId!: string;

  @Column('int')
  gatewayId!: number;

  @Column()
  returnUrl!: string;
}
