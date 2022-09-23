import { HttpModule } from '@nestjs/axios';
import { Module } from '@nestjs/common';
import { PaypalModule } from './paypal/paypal.module';
import { PaypalService } from './paypal/paypal.service';
import { StripeModule } from './stripe/stripe.module';
import { StripeService } from './stripe/stripe.service';

@Module({
  imports: [HttpModule, PaypalModule, StripeModule],
  providers: [PaypalService, StripeService],
  exports: [PaypalService, StripeService],
})
export class GatewaysModule {}
