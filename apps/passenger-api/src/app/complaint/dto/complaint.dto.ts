import { IDField } from '@ptc-org/nestjs-query-graphql';
import { ID, ObjectType } from '@nestjs/graphql';
import { ComplaintStatus } from '@vroom/database/enums/complaint-status.enum';

@ObjectType('Complaint')
export class ComplaintDTO {
  @IDField(() => ID)
  id: number;
  subject: string;
  content?: string;
  status: ComplaintStatus;
}
