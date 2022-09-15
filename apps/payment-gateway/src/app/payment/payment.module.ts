import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { CryptoModule } from '../crypto/crypto.module';
import { PaymentEntity } from '../database/payment.entity';
import { PaymentService } from './payment.service';

@Module({
  imports: [CryptoModule, TypeOrmModule.forFeature([PaymentEntity])],
  providers: [PaymentService],
  exports: [PaymentService],
})
export class PaymentModule {}
