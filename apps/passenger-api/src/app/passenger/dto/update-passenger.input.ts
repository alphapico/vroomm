import {
  BeforeUpdateOne,
  UpdateOneInputType,
} from '@ptc-org/nestjs-query-graphql';
import { InputType, Field } from '@nestjs/graphql';
import { Gender } from '@vroom/database/enums/gender.enum';
import { PassengerDocumentType } from '@vroom/database/enums/passenger-document-type';
import { UserContext } from '../../auth/authenticated-user';

@InputType()
@BeforeUpdateOne(
  (input: UpdateOneInputType<UpdatePassengerInput>, context: UserContext) => {
    input.id = context.req.user.id;
    return input;
  }
)
export class UpdatePassengerInput {
  @Field()
  firstName?: string;
  lastName?: string;
  gender?: Gender;
  email?: string;
  notificationPlayerId?: string;
  isResident?: boolean;
  idNumber?: string;
  documentType?: PassengerDocumentType;
}
