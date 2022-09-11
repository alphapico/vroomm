import { Column, Entity, PrimaryGeneratedColumn } from 'typeorm';

export enum PaymentGatewayType {
  Stripe = 'stripe',
  BrainTree = 'braintree',
  PayPal = 'paypal',
  CustomLink = 'link',
}

@Entity('payment_gateway')
export class PaymentGatewayEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  title: string;

  @Column('enum', {
    enum: PaymentGatewayType,
  })
  type: PaymentGatewayType;

  @Column({
    nullable: true,
  })
  publicKey?: string;

  @Column()
  privateKey?: string;

  @Column({
    nullable: true,
  })
  merchantId?: string;

  @Column({ nullable: true })
  saltKey?: string;
}
