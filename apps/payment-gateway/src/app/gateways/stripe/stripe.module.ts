import { Module } from '@nestjs/common';
import { PaymentModule } from '../../payment/payment.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { StripeService } from './stripe.service';
import { StripeController } from './stripe.controller';
import { PaymentGatewayEntity } from '../../database/payment-gateway.entity';

@Module({
  imports: [PaymentModule, TypeOrmModule.forFeature([PaymentGatewayEntity])],
  providers: [StripeService],
  exports: [StripeService],
  controllers: [StripeController],
})
export class StripeModule {}
