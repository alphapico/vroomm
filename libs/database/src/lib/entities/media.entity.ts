import {
  Column,
  Entity,
  OneToOne,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { DriverEntity } from './driver.entity';
import { OperatorEntity } from './operator.entity';
import { PassengerEntity } from './passenger.entity';
import { ServiceEntity } from './service.entity';

@Entity('media')
export class MediaEntity {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column('varchar')
  address!: string;

  @Column('longtext', {
    nullable: true,
  })
  base64?: string;

  @OneToOne(() => DriverEntity, (driver) => driver.media, {
    onDelete: 'SET NULL',
  })
  driver?: DriverEntity;

  @ManyToOne(() => DriverEntity, (driver) => driver.documents, {
    onDelete: 'SET NULL',
  })
  driverDocument?: DriverEntity;

  @Column({ nullable: true })
  driverDocumentId?: number;

  @OneToOne(() => OperatorEntity, (operator) => operator.media, {
    onDelete: 'SET NULL',
  })
  operator?: OperatorEntity;

  @OneToOne(() => PassengerEntity, (passenger) => passenger.media, {
    onDelete: 'SET NULL',
  })
  passenger?: PassengerEntity[];

  @OneToOne(() => ServiceEntity, (service) => service.media, {
    onDelete: 'SET NULL',
  })
  service?: ServiceEntity[];
}
