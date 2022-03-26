import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import { Point } from '../interfaces/point';
import { PointTransformer } from '../transformers/point.transformer';
import { PassengerAddressType } from './enums/passenger-address-type.enum';
import { PassengerEntity } from './passenger.entity';

@Entity('passenger_address')
export class PassengerAddressEntity {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column('enum', {
    enum: PassengerAddressType,
    default: PassengerAddressType.Other,
  })
  type!: PassengerAddressType;

  @Column()
  title!: string;

  @Column({ nullable: true, name: 'address' })
  details?: string;

  @Column('point', {
    transformer: new PointTransformer(),
  })
  location!: Point;

  @ManyToOne(() => PassengerEntity, (passenger) => passenger.addresses)
  passenger!: PassengerEntity;

  @Column()
  passengerId!: number;
}
