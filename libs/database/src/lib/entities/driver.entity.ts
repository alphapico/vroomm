import {
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  JoinColumn,
  JoinTable,
  ManyToMany,
  ManyToOne,
  OneToMany,
  OneToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { CarColorEntity } from './car-color.entity';
import { CarModelEntity } from './car-model.entity';
import { DriverTransactionEntity } from './driver-transaction.entity';
import { DriverWalletEntity } from './driver-wallet.entity';
import { DriverStatus } from './enums/driver-status.enum';
import { Gender } from './enums/gender.enum';
import { FeedbackEntity } from './feedback.entity';
import { MediaEntity } from './media.entity';
import { OrderEntity } from './order.entity';
import { ServiceEntity } from './service.entity';

@Entity('driver')
export class DriverEntity {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column({
    nullable: true,
  })
  firstName?: string;

  @Column({
    nullable: true,
  })
  lastName?: string;

  @Column('bigint', {
    unique: true,
  })
  mobileNumber!: string;

  @Column({
    nullable: true,
  })
  certificateNumber?: string;

  @Column({
    nullable: true,
  })
  email?: string;

  @ManyToOne(() => CarModelEntity, (car) => car.drivers, {
    onDelete: 'SET NULL',
  })
  car?: CarModelEntity;

  @Column({ nullable: true })
  carId?: number;

  @Column('varchar', {
    nullable: true,
    name: 'carColor',
  })
  carColorLegacy?: string;

  @ManyToOne(() => CarColorEntity, (carColor) => carColor.drivers)
  carColor?: CarColorEntity;

  @Column({ nullable: true })
  carColorId?: number;

  @Column('int', {
    nullable: true,
  })
  carProductionYear?: number;

  @Column({
    nullable: true,
  })
  carPlate?: string;

  @Column('int', { nullable: true })
  searchDistance?: number;

  @Column('enum', {
    default: DriverStatus.WaitingDocuments,
    enum: DriverStatus,
  })
  status!: DriverStatus;

  @Column('enum', {
    nullable: true,
    enum: Gender,
  })
  gender?: Gender;

  @CreateDateColumn()
  registrationTimestamp!: Date;

  @Column('tinyint', { nullable: true })
  rating?: number;

  @Column('smallint', { default: 0 })
  reviewCount!: number;

  @Column({
    nullable: true,
  })
  lastSeenTimestamp?: Date;

  @ManyToMany(() => ServiceEntity, (service) => service.drivers)
  @JoinTable({ name: 'driver_services_service' })
  enabledServices!: ServiceEntity[];

  @OneToMany(() => MediaEntity, (media) => media.driverDocument)
  documents!: MediaEntity[];

  @Column({
    nullable: true,
  })
  accountNumber?: string;

  @Column({
    nullable: true,
  })
  bankName?: string;

  @Column({
    nullable: true,
  })
  bankRoutingNumber?: string;

  @Column({ nullable: true })
  bankSwift?: string;

  @Column({ nullable: true })
  address?: string;

  @Column({ nullable: true })
  notificationPlayerId?: string;

  @Column({ nullable: true, name: 'documentsNote' })
  softRejectionNote?: string;

  @DeleteDateColumn()
  deletedAt?: Date;

  @OneToOne(() => MediaEntity, (media) => media.driver)
  @JoinColumn()
  media?: MediaEntity;

  @Column({ nullable: true })
  mediaId?: number;

  @OneToMany(() => FeedbackEntity, (feedback) => feedback.driver)
  feedbacks!: FeedbackEntity[];

  @OneToMany(() => DriverWalletEntity, (wallet) => wallet.driver)
  wallet!: DriverWalletEntity[];

  @OneToMany(
    () => DriverTransactionEntity,
    (driverTransaction) => driverTransaction.driver
  )
  transactions!: DriverTransactionEntity[];

  @OneToMany(() => OrderEntity, (order) => order.driver)
  orders!: OrderEntity[];
}
