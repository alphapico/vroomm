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
  @Field({ nullable: true })
  firstName?: string;
  @Field({ nullable: true })
  lastName?: string;
  @Field(() => Gender, { nullable: true })
  gender?: Gender;
  @Field({ nullable: true })
  email?: string;
  @Field({ nullable: true })
  notificationPlayerId?: string;
  @Field({ nullable: true })
  isResident?: boolean;
  @Field({ nullable: true })
  idNumber?: string;
  @Field(() => PassengerDocumentType, { nullable: true })
  documentType?: PassengerDocumentType;
}
