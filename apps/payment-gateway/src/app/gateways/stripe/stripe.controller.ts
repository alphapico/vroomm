import {
  Controller,
  ForbiddenException,
  Get,
  Post,
  Req,
  Res,
} from '@nestjs/common';
import { FastifyRequest, FastifyReply } from 'fastify';
import { InjectRepository } from '@nestjs/typeorm';

import { Repository } from 'typeorm';
import { PaymentService } from '../../payment/payment.service';
import { StripeService } from './stripe.service';
import { PaymentGatewayEntity } from '../../database/payment-gateway.entity';
import { PaymentStatus } from '../../database/payment.entity';

@Controller('stripe')
export class StripeController {
  constructor(
    private stripeService: StripeService,
    @InjectRepository(PaymentGatewayEntity)
    private gatewayRepository: Repository<PaymentGatewayEntity>,
    private paymentService: PaymentService
  ) {}

  // @Get('redirect')
  // async redirect(@Req() req: FastifyRequest<{Querystring: {sessionId: string, publicKey: string}}>, @Res() res: FastifyReply) {
  //     const html = `<html><head><title>Redirecting to stripe</title> <script src="https://js.stripe.com/v3/"></script> </head><body> <script type="text/javascript">var stripe=Stripe('${req.query.publicKey}');stripe.redirectToCheckout({sessionId:'${req.query.sessionId}'}).then(function(result){if(result.error){alert(result.error.message);}}).catch(function(error){console.error('Error:',error);});</script> </body></html>`;
  //     res.send(html);
  // }

  @Post('webhook')
  async webHook(@Req() req: FastifyRequest, @Res() res: FastifyReply) {
    res.send({ status: 'OK' });
  }

  @Get('success')
  async verify(
    @Req() req: FastifyRequest<{ Querystring: { transactionId: string } }>,
    @Res() res: FastifyReply
  ) {
    let payment = await this.paymentService.getOne(req.query.transactionId);
    if (payment == null) {
      throw new ForbiddenException('Transaction Not found.');
    }
    //const paymentMethod = await this.gatewayRepository.findOne(payment.gatewayId);
    //this.stripeService.verify(paymentMethod, req.query.transactionId);
    payment = await this.paymentService.updatePaymentStatus(
      payment.id,
      PaymentStatus.Success
    );
    const encrypted = await this.paymentService.getEncryptedWithPayment(
      payment!
    );
    res.redirect(301, `${payment!.returnUrl}?token=${encrypted}`);
  }

  @Get('cancel')
  async cancel(
    @Req() req: FastifyRequest<{ Querystring: { transactionId: string } }>,
    @Res() res: FastifyReply
  ) {
    let payment = await this.paymentService.getOne(req.query.transactionId);
    payment = await this.paymentService.updatePaymentStatus(
      payment!.id,
      PaymentStatus.Canceled
    );
    const encrypted = await this.paymentService.getEncryptedWithPayment(
      payment!
    );
    res.redirect(301, `${payment!.returnUrl}?token=${encrypted}`);
  }
}
