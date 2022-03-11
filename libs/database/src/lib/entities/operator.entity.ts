import {
  Column,
  Entity,
  JoinColumn,
  ManyToOne,
  OneToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';
import { MediaEntity } from './media.entity';
import { OperatorRoleEntity } from './operator-role.entity';

@Entity('operator')
export class OperatorEntity {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column({ nullable: true })
  firstName?: string;

  @Column({ nullable: true })
  lastName?: string;

  @Column({ unique: true })
  userName!: string;

  @Column({ default: 'admin' })
  password!: string;

  @Column('bigint', {
    nullable: true,
    unique: true,
  })
  mobileNumber?: string;

  @Column({ nullable: true })
  email?: string;

  @Column({ nullable: true })
  address?: string;

  @OneToOne(() => MediaEntity, (media) => media.operator)
  @JoinColumn()
  media?: MediaEntity;

  @Column({ nullable: true })
  mediaId?: number;

  @ManyToOne(() => OperatorRoleEntity, (role) => role.operators)
  role?: OperatorRoleEntity;

  @Column({ nullable: true })
  roleId?: number;
}
