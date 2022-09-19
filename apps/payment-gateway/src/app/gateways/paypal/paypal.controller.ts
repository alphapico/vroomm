import { Controller, ForbiddenException, Get, Req, Res } from '@nestjs/common';
import { FastifyRequest, FastifyReply } from 'fastify';
import { PaypalService } from './paypal.service';
import { InjectRepository } from '@nestjs/typeorm';

import { Repository } from 'typeorm';
import { PaymentService } from '../../payment/payment.service';
import { PaymentGatewayEntity } from '../../database/payment-gateway.entity';
import { PaymentStatus } from '../../database/payment.entity';

@Controller('paypal')
export class PaypalController {
  constructor(
    private payPalService: PaypalService,
    @InjectRepository(PaymentGatewayEntity)
    private gatewayRepository: Repository<PaymentGatewayEntity>,
    private paymentService: PaymentService
  ) {}

  @Get('verify')
  async verifyPayPal(
    @Req() req: FastifyRequest<{ Querystring: { token: string } }>,
    @Res() res: FastifyReply
  ) {
    const payment = await this.paymentService.getOne(req.query.token);
    if (payment == null) {
      throw new ForbiddenException('Transaction Not found.');
    }
    const paymentMethod = await this.gatewayRepository.findOne({
      where: { id: payment.gatewayId },
    });
    this.payPalService.verify(paymentMethod!, payment.transactionNumber);
    const encrypted = await this.paymentService.getEncryptedWithPayment(
      payment
    );
    await this.paymentService.updatePaymentStatus(
      payment.id,
      PaymentStatus.Success
    );
    res.redirect(301, `${payment.returnUrl}?token=${encrypted}`);
  }

  @Get('cancel')
  async cancelPayPal(
    @Req() req: FastifyRequest<{ Querystring: { token: string } }>,
    @Res() res: FastifyReply
  ) {
    const payment = await this.paymentService.getOne(req.query.token);
    const encrypted = await this.paymentService.getEncryptedWithPayment(
      payment!
    );
    await this.paymentService.updatePaymentStatus(
      payment!.id,
      PaymentStatus.Canceled
    );
    res.redirect(301, `${payment!.returnUrl}?token=${encrypted}`);
  }
}
