import { IDField, Relation } from '@ptc-org/nestjs-query-graphql';
import { Field, ID, ObjectType } from '@nestjs/graphql';
import { MediaDTO } from '../../upload/media.dto';

@ObjectType('Passenger')
@Relation('media', () => MediaDTO, {
  nullable: true,
  disableRemove: true,
  disableUpdate: true,
})
export class PassengerDTO {
  @IDField(() => ID)
  id!: number;
  @Field({ nullable: true })
  firstName?: string;
  @Field({ nullable: true })
  lastName?: string;
  @Field()
  mobileNumber: string;
}
