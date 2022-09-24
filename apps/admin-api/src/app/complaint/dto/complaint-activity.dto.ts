import {
  FilterableField,
  IDField,
  Relation,
} from '@ptc-org/nestjs-query-graphql';
import { Field, ID, ObjectType } from '@nestjs/graphql';
import { ComplaintActivityType } from '@vroom/database/enums/complaint-activity-type.enum';
import { OperatorDTO } from '../../operator/dto/operator.dto';

@ObjectType('ComplaintActivity')
@Relation('actor', () => OperatorDTO)
@Relation('assignedTo', () => OperatorDTO, { nullable: true })
export class ComplaintActivityDTO {
  @IDField(() => ID)
  id!: number;
  @Field(() => ComplaintActivityType)
  type: ComplaintActivityType;
  @Field({ nullable: true })
  comment?: string;
  @FilterableField(() => ID)
  complaintId: number;
}
