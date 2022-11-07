import { IDField, Relation } from '@ptc-org/nestjs-query-graphql';
import { Field, Float, ID, Int, ObjectType } from '@nestjs/graphql';
import { MediaDTO } from '../../upload/media.dto';
import { CarColorDTO } from './car-color.dto';
import { CarModelDTO } from './car-model.dto';

@ObjectType('Driver')
@Relation('car', () => CarModelDTO, {
  nullable: true,
  disableRemove: true,
  disableUpdate: true,
})
@Relation('carColor', () => CarColorDTO, {
  nullable: true,
  disableRemove: true,
  disableUpdate: true,
})
@Relation('media', () => MediaDTO, {
  nullable: true,
  disableRemove: true,
  disableUpdate: true,
})
export class DriverDTO {
  @IDField(() => ID)
  id: number;
  @Field()
  mobileNumber: string;
  @Field({ nullable: true })
  firstName?: string;
  @Field({ nullable: true })
  carPlate?: string;
  @Field({ nullable: true })
  lastName?: string;
  @Field(() => Int, { nullable: true })
  rating?: number;
  @Field(() => Float)
  reviewCount: number;
}
