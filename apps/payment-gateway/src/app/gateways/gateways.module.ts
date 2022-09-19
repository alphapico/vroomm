import { HttpModule } from '@nestjs/axios';
import { Module } from '@nestjs/common';
import { PaypalModule } from './paypal/paypal.module';
import { PaypalService } from './paypal/paypal.service';

@Module({
  imports: [HttpModule, PaypalModule],
  providers: [PaypalService],
  exports: [PaypalService],
})
export class GatewaysModule {}
