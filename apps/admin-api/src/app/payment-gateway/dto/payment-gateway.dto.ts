import { Authorize, IDField, Relation } from '@ptc-org/nestjs-query-graphql';
import { ID, ObjectType, Field } from '@nestjs/graphql';
import { PaymentGatewayType } from '@vroom/database/enums/payment-gateway-type.enum';
import { MediaDTO } from '../../upload/media.dto';
import { GatewayAuthorizer } from './gateway.authorizer';

@ObjectType('PaymentGateway')
@Authorize(GatewayAuthorizer)
@Relation('media', () => MediaDTO, { nullable: true })
export class PaymentGatewayDTO {
  @IDField(() => ID)
  id!: number;

  @Field()
  enabled!: boolean;

  @Field()
  title!: string;

  @Field(() => PaymentGatewayType)
  type!: PaymentGatewayType;

  @Field({ nullable: true })
  publicKey?: string;

  @Field()
  privateKey: string;

  @Field({ nullable: true })
  merchantId?: string;

  @Field({ nullable: true })
  saltKey?: string;

  @Field(() => ID, { nullable: true })
  mediaId?: number;
}
