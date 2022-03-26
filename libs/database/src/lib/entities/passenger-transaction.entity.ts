import {
  Column,
  CreateDateColumn,
  Entity,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';

import { PassengerDeductTransactionType } from './enums/passenger-deduct-transaction-type.enum';
import { PassengerRechargeTransactionType } from './enums/passenger-recharge-transaction-type.enum';
import { TransactionAction } from './enums/transaction-action.enum';
import { TransactionStatus } from './enums/transaction-status.enum';
import { OperatorEntity } from './operator.entity';
import { PassengerEntity } from './passenger.entity';

@Entity('passenger_transaction')
export class PassengerTransactionEntity {
  @PrimaryGeneratedColumn()
  id!: number;

  @CreateDateColumn({ name: 'transactionTime' })
  createdAt!: Date;

  @Column('enum', {
    enum: TransactionStatus,
    default: TransactionStatus.Processing,
  })
  status!: TransactionStatus;

  @Column('enum', { enum: TransactionAction })
  action!: TransactionAction;

  @Column('enum', {
    enum: PassengerDeductTransactionType,
    nullable: true,
  })
  deductType?: PassengerDeductTransactionType;

  @Column('enum', {
    enum: PassengerRechargeTransactionType,
    nullable: true,
  })
  rechargeType?: PassengerRechargeTransactionType;

  @Column('float', {
    default: '0.00',
    precision: 10,
    scale: 2,
  })
  amount!: number;

  @Column('char', { length: '3' })
  currency!: string;

  @Column({ nullable: true, name: 'documentNumber' })
  refrenceNumber?: string;

  @Column({ nullable: true, name: 'details' })
  description?: string;

  @ManyToOne(() => PassengerEntity, (passenger) => passenger.transactions, {
    onDelete: 'CASCADE',
    onUpdate: 'RESTRICT',
  })
  passenger!: PassengerEntity;

  @Column()
  passengerId!: number;

  @ManyToOne(() => OperatorEntity, (operator) => operator.passengerTransactions)
  operator?: OperatorEntity;

  @Column({ nullable: true, name: 'operatorId' })
  operatorId?: number;
}
