import {
  FilterableCursorConnection,
  FilterableField,
  IDField,
} from '@ptc-org/nestjs-query-graphql';
import { ID, ObjectType, Field } from '@nestjs/graphql';
import { ServiceOptionIcon } from '@vroom/database/enums/service-option-icon.enum';
import { ServiceOptionType } from '@vroom/database/enums/service-option-type.enum';

@ObjectType('ServiceOption')
export class ServiceOptionDTO {
  @IDField(() => ID)
  id: number;

  @Field()
  name: string;

  @Field(() => ServiceOptionType)
  type: ServiceOptionType;

  @Field()
  additionalFee?: number;

  @Field(() => ServiceOptionIcon)
  icon: ServiceOptionIcon;

  @FilterableField(() => ID)
  serviceId: number;
}
