import { Injectable } from '@nestjs/common';
import { Stripe } from 'stripe';
import { PaymentGatewayEntity } from '../../database/payment-gateway.entity';
import { PaymentLinkResult } from '../paypal/paypal.service';

@Injectable()
export class StripeService {
  async getPaymentLink(
    userType: string,
    userId: string,
    merchantId: string,
    privateKey: string,
    currency: string,
    amount: string
  ): Promise<PaymentLinkResult> {
    const transactionId = `${userType}_${userId}_${new Date().getTime()}`;

    const instance = new Stripe(privateKey, { apiVersion: '2020-08-27' });
    const session = await instance.checkout.sessions.create({
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: currency,
            product_data: {
              name: 'Top-up wallet',
            },
            unit_amount: Math.round(parseFloat(amount)) * 100,
          },
          quantity: 1,
        },
      ],
      mode: 'payment',
      success_url: `${process.env.GATEWAY_SERVER_URL}/stripe/success?transactionId=${transactionId}`,
      cancel_url: `${process.env.GATEWAY_SERVER_URL}/stripe/cancel?transactionId=${transactionId}`,
    });
    return {
      invoiceId: transactionId,
      url: session.url!,
    };
  }

  async verify(
    paymentGateway: PaymentGatewayEntity,
    transactionNumber: string
  ) {
    const instance = new Stripe(paymentGateway.privateKey!, {
      apiVersion: '2020-08-27',
    });
    const response = instance.checkout.sessions.retrieve(transactionNumber);
    return response;
  }
}
