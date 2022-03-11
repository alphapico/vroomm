import { Column, Entity, OneToOne, PrimaryGeneratedColumn } from 'typeorm';
import { OperatorEntity } from './operator.entity';
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

  @Column({ nullable: true })
  driverDocumentId?: number;

  @OneToOne(() => OperatorEntity, (operator) => operator.media, {
    onDelete: 'SET NULL',
  })
  operator?: OperatorEntity;

  @OneToOne(() => ServiceEntity, (service) => service.media, {
    onDelete: 'SET NULL',
  })
  service?: ServiceEntity[];
}
