import { Injectable, Logger } from '@nestjs/common';
import * as paypal from '@paypal/checkout-server-sdk';
import { PaymentGatewayEntity } from '../../database/payment-gateway.entity';

@Injectable()
export class PaypalService {
  async getPaymentLink(
    merchantId: string,
    privateKey: string,
    currency: string,
    amount: string
  ): Promise<PaymentLinkResult> {
    Logger.log(
      `getting payment link in ${
        process.env.DEMO_MODE != null ? 'DEMO MODE' : 'PRODUCTION MODE'
      }`
    );
    Logger.log(`merchantId: ${merchantId}, privateKey: ${privateKey}`);
    const environment =
      process.env.DEMO_MODE != null
        ? new paypal.core.SandboxEnvironment(merchantId, privateKey)
        : new paypal.core.LiveEnvironment(merchantId, privateKey);
    const client = new paypal.core.PayPalHttpClient(environment);
    const request = new paypal.orders.OrdersCreateRequest();
    request.requestBody({
      intent: 'CAPTURE',
      application_context: {
        return_url: `${process.env.GATEWAY_SERVER_URL}/paypal/verify`,
        cancel_url: `${process.env.GATEWAY_SERVER_URL}/paypal/cancel`,
        shipping_preference: 'NO_SHIPPING',
      },
      purchase_units: [
        {
          amount: {
            currency_code: currency,
            value: amount,
          },
        },
      ],
    });
    const response = await client.execute(request);
    console.log(`PayPal Result: ${JSON.stringify(response)}`);
    if (response.result?.id == null) {
      throw new Error(JSON.stringify(response));
    }
    const res: PayPalPaymentLinkResult = response.result;
    return {
      invoiceId: res.id,
      url: res.links.filter((link) => link.rel == 'approve')[0].href,
    };
  }

  async verify(
    paymentGateway: PaymentGatewayEntity,
    transactionNumber: string
  ): Promise<boolean> {
    const environment =
      process.env.DEMO_MODE != null
        ? new paypal.core.SandboxEnvironment(
            paymentGateway.merchantId!,
            paymentGateway.privateKey!
          )
        : new paypal.core.LiveEnvironment(
            paymentGateway.merchantId!,
            paymentGateway.privateKey!
          );
    const client = new paypal.core.PayPalHttpClient(environment);
    const request = new paypal.orders.OrdersCaptureRequest(transactionNumber);
    // request.requestBody({});
    const response = await client.execute(request);
    return true;
  }
}

interface PayPalPaymentLinkResult {
  id: string;
  links: PayPalPaymentLinksArrayItem[];
  status: string;
}

interface PayPalPaymentLinksArrayItem {
  href: string;
  method: 'GET' | 'POST' | 'PATCH';
  rel: 'self' | 'approve' | 'update' | 'capture';
}

interface PayPalCaptureOrderResult {
  id: string;
  links: PayPalPaymentLinkResult[];
  payer: unknown;
  purchase_units: unknown[];
  status: string;
}

export interface PaymentLinkResult {
  url: string;
  invoiceId: string;
}
