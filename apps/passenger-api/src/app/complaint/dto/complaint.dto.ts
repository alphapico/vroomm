import { IDField } from '@ptc-org/nestjs-query-graphql';
import { Field, ID, ObjectType } from '@nestjs/graphql';
import { ComplaintStatus } from '@vroom/database/enums/complaint-status.enum';

@ObjectType('Complaint')
export class ComplaintDTO {
  @IDField(() => ID)
  id: number;
  @Field()
  subject: string;
  @Field({ nullable: true })
  content?: string;
  @Field(() => ComplaintStatus)
  status: ComplaintStatus;
}
