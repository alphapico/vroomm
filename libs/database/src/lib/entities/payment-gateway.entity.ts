import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  OneToMany,
  JoinColumn,
  OneToOne,
} from 'typeorm';
import { PassengerTransactionEntity } from './passenger-transaction.entity';
import { PaymentGatewayType } from './enums/payment-gateway-type.enum';
import { MediaEntity } from './media.entity';

@Entity('payment_gateway')
export class PaymentGatewayEntity {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column({
    default: true,
  })
  enabled!: boolean;

  @Column()
  title!: string;

  @Column('enum', {
    enum: PaymentGatewayType,
  })
  type!: PaymentGatewayType;

  @Column({
    nullable: true,
    length: 1000,
  })
  publicKey?: string;

  @Column()
  privateKey!: string;

  @Column({ nullable: true })
  saltKey?: string;

  @Column({
    nullable: true,
  })
  merchantId?: string;

  @OneToOne(() => MediaEntity, (media) => media.paymentGateway, {
    nullable: true,
  })
  @JoinColumn()
  media?: MediaEntity;

  @Column({ nullable: true })
  mediaId?: number;

  @OneToMany(
    () => PassengerTransactionEntity,
    (userTransaction) => userTransaction.paymentGateway
  )
  passengerTransactions?: PassengerTransactionEntity[];
}
