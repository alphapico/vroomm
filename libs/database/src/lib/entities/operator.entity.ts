import {
  Column,
  Entity,
  JoinColumn,
  ManyToOne,
  OneToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { DriverTransactionEntity } from './driver-transaction.entity';
import { MediaEntity } from './media.entity';
import { OperatorRoleEntity } from './operator-role.entity';
import { PassengerTransactionEntity } from './passenger-transaction.entity';
import { OrderEntity } from './order.entity';

@Entity('operator')
export class OperatorEntity {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column({ nullable: true })
  firstName?: string;

  @Column({ nullable: true })
  lastName?: string;

  @Column({ unique: true })
  userName!: string;

  @Column({ default: 'admin' })
  password!: string;

  @Column('bigint', {
    nullable: true,
    unique: true,
  })
  mobileNumber?: string;

  @Column({ nullable: true })
  email?: string;

  @Column({ nullable: true })
  address?: string;

  @OneToOne(() => MediaEntity, (media) => media.operator)
  @JoinColumn()
  media?: MediaEntity;

  @Column({ nullable: true })
  mediaId?: number;

  @ManyToOne(() => OperatorRoleEntity, (role) => role.operators)
  role?: OperatorRoleEntity;

  @Column({ nullable: true })
  roleId?: number;

  @OneToMany(() => OrderEntity, (order) => order.operator)
  orders!: OrderEntity[];

  @OneToMany(
    () => PassengerTransactionEntity,
    (passengerTransaction) => passengerTransaction.operator
  )
  passengerTransactions!: PassengerTransactionEntity[];

  @OneToMany(
    () => DriverTransactionEntity,
    (driverTransaction) => driverTransaction.operator
  )
  driverTransactions!: DriverTransactionEntity[];
}
