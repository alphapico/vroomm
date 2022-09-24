import { IDField, Relation } from '@ptc-org/nestjs-query-graphql';
import { Field, Float, ID, ObjectType } from '@nestjs/graphql';
import { MediaDTO } from '../../upload/media.dto';

@ObjectType('ServiceWithCost')
export class ServiceWithCostDTO {
  @IDField(() => ID)
  id: number;
  @Field()
  name: string;
  @Field(() => Float)
  cost: number;
  @Field(() => MediaDTO)
  media: MediaDTO;
}
