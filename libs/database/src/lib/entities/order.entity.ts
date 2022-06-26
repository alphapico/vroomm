import {
  Column,
  CreateDateColumn,
  Entity,
  JoinTable,
  JoinColumn,
  ManyToMany,
  ManyToOne,
  OneToOne,
  OneToMany,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { Point } from '../interfaces/point';
import { MultipointTransformer } from '../transformers/multipoint.transformer';
import { ComplaintEntity } from './complaint.entity';
import { CouponEntity } from './coupon.entity';
import { DriverTransactionEntity } from './driver-transaction.entity';
import { DriverEntity } from './driver.entity';
import { OrderStatus } from './enums/order-status.enum';
import { FeedbackEntity } from './feedback.entity';
import { OrderMessageEntity } from './order-message.entity';
import { PaymentGatewayEntity } from './payment-gateway.entity';
import { PassengerEntity } from './passenger.entity';
import { PassengerTransactionEntity } from './passenger-transaction.entity';
import { ServiceEntity } from './service.entity';
import { OperatorEntity } from './operator.entity';
import { OrderActivityEntity } from './order-activity.entity';
import { ServiceOptionEntity } from './service-option.entity';

@Entity('order')
export class OrderEntity {
  @PrimaryGeneratedColumn()
  id!: number;

  @CreateDateColumn({ name: 'orderTimestamp' })
  createdOn!: Date;

  @Column({ nullable: true })
  startTimestamp?: Date;

  @Column({ nullable: true })
  finishTimestamp?: Date;

  @Column('enum', {
    enum: OrderStatus,
    default: OrderStatus.Requested,
  })
  status!: OrderStatus;

  @Column('int', { default: 0 })
  distanceBest!: number;

  @Column('int', { default: 0 })
  durationBest!: number;

  @Column('int', { default: 0 })
  waitMinutes!: number;

  @Column()
  expectedTimestamp!: Date;

  @Column({ nullable: true })
  etaPickup?: Date;

  @Column('float', {
    precision: 10,
    scale: 2,
  })
  costBest!: number;

  @Column('float', {
    precision: 10,
    scale: 2,
    default: '0.00',
  })
  costAfterCoupon!: number;

  @Column('float', {
    precision: 10,
    scale: 2,
    default: '0.00',
  })
  tipAmount!: number;

  @Column('float', {
    default: 0,
    precision: 10,
    scale: 2,
  })
  paidAmount!: number;

  @Column('float', {
    precision: 10,
    default: 0,
    scale: 2,
  })
  providerShare!: number;

  @OneToMany(() => OrderActivityEntity, (activity) => activity.order)
  activities!: OrderActivityEntity[];

  @Column('varchar', {
    transformer: {
      to(value: string[]): string {
        return value.join('|');
      },
      from(value: string): string[] {
        if (value == null) return [];
        return value.split('|');
      },
    },
    length: 500,
  })
  addresses!: string[];

  @Column('multipoint', {
    transformer: new MultipointTransformer(),
  })
  points!: Point[];

  @Column('multipoint', {
    transformer: new MultipointTransformer(),
    nullable: true,
  })
  directions?: Point[];

  @ManyToOne(() => DriverEntity, (driver) => driver.orders, {
    onDelete: 'SET NULL',
    onUpdate: 'CASCADE',
  })
  driver?: DriverEntity;

  @Column({ nullable: true })
  driverId?: number;

  @ManyToOne(() => PassengerEntity, (passenger) => passenger.orders)
  passenger!: PassengerEntity;

  @Column()
  passengerId!: number;

  @ManyToOne(() => CouponEntity, (coupon) => coupon.orders)
  coupon?: CouponEntity;

  @Column({ nullable: true })
  couponId?: number;

  @Column('char', { length: 3 })
  currency!: string;

  @OneToMany(() => OrderMessageEntity, (message) => message.order)
  conversation!: OrderMessageEntity[];

  @ManyToOne(() => PaymentGatewayEntity, (gateway) => gateway.orders)
  paymentGateway?: PaymentGatewayEntity;

  @Column({ nullable: true })
  paymentGatewayId?: number;

  @OneToMany(() => ComplaintEntity, (complaint) => complaint.order)
  complaints!: ComplaintEntity[];

  @ManyToOne(() => ServiceEntity, (service) => service.orders)
  service!: ServiceEntity;

  @Column()
  serviceId!: number;

  @ManyToOne(() => OperatorEntity, (operator) => operator.orders, {
    onDelete: 'RESTRICT',
    onUpdate: 'RESTRICT',
  })
  operator?: OperatorEntity;

  @Column({ nullable: true })
  operatorId?: number;

  @OneToMany(
    () => PassengerTransactionEntity,
    (passengerTransaction) => passengerTransaction.order
  )
  passengerTransactions!: PassengerTransactionEntity[];

  @OneToOne(() => FeedbackEntity, (feedback) => feedback.order)
  @JoinColumn()
  review?: FeedbackEntity;

  @Column({ nullable: true })
  reviewId?: number;

  @OneToMany(() => DriverTransactionEntity, (transaction) => transaction.order)
  driverTransactions!: DriverTransactionEntity[];

  @ManyToMany(() => ServiceOptionEntity, (option) => option.orders, {
    onDelete: 'CASCADE',
  })
  @JoinTable()
  options!: ServiceOptionEntity[];
}
