import {
  Field,
  Float,
  ID,
  InputType,
  ObjectType,
  registerEnumType,
} from '@nestjs/graphql';

export enum TopUpWalletStatus {
  OK = 'ok',
  Redirect = 'redirect',
}
registerEnumType(TopUpWalletStatus, { name: 'TopUpWalletStatus' });

@InputType()
export class TopUpWalletInput {
  @Field(() => ID)
  gatewayId: number;
  @Field(() => Float)
  amount: number;
  @Field()
  currency: string;
  @Field({ nullable: true })
  token?: string;
  @Field(() => Float, { nullable: true })
  pin?: number;
  @Field(() => Float, { nullable: true })
  otp?: number;
  @Field({ nullable: true })
  transactionId?: string;
}

@ObjectType()
export class TopUpWalletResponse {
  @Field(() => TopUpWalletStatus)
  status: TopUpWalletStatus;
  @Field()
  url: string;
}
