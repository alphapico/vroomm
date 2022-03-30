import { registerEnumType } from '@nestjs/graphql';

export enum PaymentGatewayType {
  Stripe = 'stripe',
  BrainTree = 'braintree',
  PayPal = 'paypal',
  CustomLink = 'link',
}
registerEnumType(PaymentGatewayType, { name: 'PaymentGatewayType' });
