import { Module } from '@nestjs/common';
import { PaypalService } from './paypal.service';
import { PaypalController } from './paypal.controller';
import { PaymentModule } from '../../payment/payment.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PaymentGatewayEntity } from '../../database/payment-gateway.entity';

@Module({
  imports: [
    PaymentModule,
    TypeOrmModule.forFeature([PaymentGatewayEntity])
  ],
  providers: [PaypalService],
  exports: [PaypalService],
  controllers: [PaypalController]
})
export class PaypalModule {}
