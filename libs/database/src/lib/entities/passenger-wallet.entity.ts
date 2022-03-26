import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import { PassengerEntity } from './passenger.entity';

@Entity('passenger_wallet')
export class PassengerWalletEntity {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column('float', {
    default: 0.0,
    name: 'amount',
  })
  balance!: number;

  @Column('char', { length: 3 })
  currency!: string;

  @ManyToOne(() => PassengerEntity, (passenger) => passenger.wallets)
  passenger!: PassengerEntity;

  @Column()
  passengerId!: number;
}
