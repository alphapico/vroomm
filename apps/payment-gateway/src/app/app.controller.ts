import { Controller, Get, Req, Res } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { FastifyReply, FastifyRequest } from 'fastify';
import { Repository } from 'typeorm';
import { AppService } from './app.service';
import { PaymentLinkResult } from './gateways/paypal/paypal.service';

import { PayInterface, PaymentService } from './payment/payment.service';
import { PaypalService } from './gateways/paypal/paypal.service';
import {
  PaymentGatewayEntity,
  PaymentGatewayType,
} from './database/payment-gateway.entity';
import { StripeService } from './gateways/stripe/stripe.service';

@Controller()
export class AppController {
  constructor(
    @InjectRepository(PaymentGatewayEntity)
    private gatewayRepository: Repository<PaymentGatewayEntity>,
    private paymentService: PaymentService,
    private payPalService: PaypalService,
    private stripService: StripeService
  ) {}

  @Get()
  async defaultPath(@Res() res: FastifyReply) {
    res.send(`✅ Payment Gateways microservice running`);
  }

  @Get('pay')
  async pay(
    @Req() req: FastifyRequest<{ Querystring: PayInterface }>,
    @Res() res: FastifyReply
  ) {
    const gateway = await this.gatewayRepository.findOne({
      where: { id: req.query.paymentGatewayId },
    });
    let paymentLink: PaymentLinkResult;
    if (!gateway) {
      throw new Error('Missing payment gateway!');
    }
    switch (gateway.type) {
      case PaymentGatewayType.PayPal:
        if (!gateway.merchantId || !gateway.privateKey) {
          throw new Error('Missing merchantId or privateKey!');
        }
        paymentLink = await this.payPalService.getPaymentLink(
          gateway.merchantId,
          gateway.privateKey,
          req.query.currency,
          req.query.amount
        );
        break;

      case PaymentGatewayType.Stripe:
        if (!gateway.privateKey) {
          throw new Error('Missing merchantId or privateKey!');
        }
        paymentLink = await this.stripService.getPaymentLink(
          req.query.userType,
          req.query.userId,
          gateway.privateKey,
          req.query.currency,
          req.query.amount
        );
        break;

      default: //PaymentGatewayType.CustomLink
        if (!gateway.publicKey) {
          throw new Error('Missing payment gateway publickey!');
        }
        // eslint-disable-next-line no-case-declarations
        const invoiceId = `${req.query.userType}_${
          req.query.userId
        }_${new Date().getTime()}`;
        paymentLink = {
          invoiceId,
          url: gateway.publicKey,
        };
        break;
    }
    await this.paymentService.createRecord({
      transactionNumber: paymentLink.invoiceId,
      paymentInterface: req.query,
    });

    res.redirect(301, paymentLink.url);
  }
}
