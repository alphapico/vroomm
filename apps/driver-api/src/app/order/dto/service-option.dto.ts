import { IDField } from '@ptc-org/nestjs-query-graphql';
import { Field, Float, ID, ObjectType } from '@nestjs/graphql';
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
  @Field(() => Float, { nullable: true })
  additionalFee?: number;
  @Field(() => ServiceOptionIcon)
  icon: ServiceOptionIcon;
}
