import { Column, PrimaryGeneratedColumn } from 'typeorm';
import { Entity } from 'typeorm/decorator/entity/Entity';

export enum PaymentStatus {
  Processing = 'processing',
  Success = 'success',
  Canceled = 'canceled',
  Failed = 'failed',
}

@Entity('payment')
export class PaymentEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column('enum', {
    enum: PaymentStatus,
    default: PaymentStatus.Processing,
  })
  status: PaymentStatus;

  @Column()
  amount: number;

  @Column()
  currency: string;

  @Column()
  transactionNumber: string;

  @Column()
  userType: string;

  @Column()
  userId: string;

  @Column('int')
  gatewayId: number;

  @Column()
  returnUrl: string;
}
