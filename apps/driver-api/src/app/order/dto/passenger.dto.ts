import { IDField, Relation } from '@ptc-org/nestjs-query-graphql';
import { ID, ObjectType } from '@nestjs/graphql';
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
  firstName?: string;
  lastName?: string;
  mobileNumber: string;
}
