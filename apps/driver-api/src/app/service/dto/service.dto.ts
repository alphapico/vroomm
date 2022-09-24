import { IDField, Relation } from '@ptc-org/nestjs-query-graphql';
import { Field, Float, ID, ObjectType } from '@nestjs/graphql';
import { ServicePaymentMethod } from '@vroom/database/enums/service-payment-method.enum';
import { MediaDTO } from '../../upload/media.dto';

@ObjectType('Service')
@Relation('media', () => MediaDTO, { disableUpdate: true, disableRemove: true })
export class ServiceDTO {
  @IDField(() => ID)
  id: number;
  @Field()
  name: string;
  @Field(() => ServicePaymentMethod)
  paymentMethod: ServicePaymentMethod;
  @IDField(() => Float)
  cancellationTotalFee!: number;
}
