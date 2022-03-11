import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';
import { ServiceOptionIcon } from './enums/service-option-icon.enum';
import { ServiceOptionType } from './enums/service-option-type.enum';
import { ServiceEntity } from './service.entity';

@Entity('service_option')
export class ServiceOptionEntity {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column()
  name!: string;

  @Column('enum', {
    enum: ServiceOptionType,
  })
  type!: ServiceOptionType;

  @Column('float', {
    precision: 12,
    scale: 2,
    nullable: true,
  })
  additionalFee?: number;

  @Column('enum', {
    enum: ServiceOptionIcon,
  })
  icon!: ServiceOptionIcon;

  @ManyToOne(() => ServiceEntity, (service) => service.options)
  service!: ServiceEntity;

  @Column()
  serviceId!: number;
}
