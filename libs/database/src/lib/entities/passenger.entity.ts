import {
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  JoinColumn,
  OneToMany,
  OneToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';

import { Gender } from './enums/gender.enum';
import { PassengerDocumentType } from './enums/passenger-document-type';
import { PassengerStatus } from './enums/passenger-status.enum';
import { MediaEntity } from './media.entity';
import { OrderEntity } from './order.entity';
import { PassengerAddressEntity } from './passenger-address.entity';
import { PassengerTransactionEntity } from './passenger-transaction.entity';
import { PassengerWalletEntity } from './passenger-wallet.entity';

@Entity('passenger')
export class PassengerEntity {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column('enum', {
    enum: PassengerStatus,
    default: PassengerStatus.Enabled,
  })
  status!: PassengerStatus;

  @Column({ nullable: true })
  firstName?: string;

  // @Column({ nullable: true })
  // avatarUrl?: string;

  @Column({ nullable: true })
  lastName?: string;

  @Column('bigint', {
    unique: true,
  })
  mobileNumber!: string;

  @CreateDateColumn()
  registrationTimestamp!: Date;

  @Column({ nullable: true })
  email?: string;

  @Column('enum', {
    enum: Gender,
    nullable: true,
  })
  gender?: Gender;

  @Column('varchar', {
    nullable: true,
  })
  address?: string;

  @Column({
    nullable: true,
  })
  isResident?: boolean;

  @Column({
    nullable: true,
  })
  idNumber?: string;

  @Column('enum', {
    nullable: true,
    enum: PassengerDocumentType,
  })
  documentType?: PassengerDocumentType;

  @Column({ nullable: true })
  notificationPlayerId?: string;

  @DeleteDateColumn()
  deletedAt?: Date;

  @OneToMany(() => PassengerAddressEntity, (address) => address.passenger)
  addresses!: PassengerAddressEntity[];

  @OneToOne(() => MediaEntity, (media) => media.passenger)
  @JoinColumn()
  media?: MediaEntity;

  @Column({ nullable: true })
  mediaId?: number;

  @OneToMany(() => OrderEntity, (order) => order.passenger)
  orders!: OrderEntity[];

  @OneToMany(() => PassengerWalletEntity, (wallet) => wallet.passenger)
  wallets!: PassengerWalletEntity[];

  @OneToMany(
    () => PassengerTransactionEntity,
    (passengerTransaction) => passengerTransaction.passenger
  )
  transactions!: PassengerTransactionEntity[];
}
