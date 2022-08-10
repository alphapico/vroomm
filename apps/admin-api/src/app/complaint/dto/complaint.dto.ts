import {
  FilterableField,
  IDField,
  PagingStrategies,
  Relation,
  UnPagedRelation,
} from '@ptc-org/nestjs-query-graphql';
import { ID, ObjectType } from '@nestjs/graphql';
import { ComplaintStatus } from '@vroom/database/enums/complaint-status.enum';
import { OrderDTO } from '../../order/dto/order.dto';
import { ComplaintActivityDTO } from './complaint-activity.dto';

@ObjectType('Complaint')
@UnPagedRelation('activities', () => ComplaintActivityDTO, {
  pagingStrategy: PagingStrategies.NONE,
})
@Relation('order', () => OrderDTO, { relationName: 'order' })
export class ComplaintDTO {
  @IDField(() => ID)
  id!: number;
  inscriptionTimestamp!: Date;
  requestedByDriver: boolean;
  subject: string;
  content?: string;
  @FilterableField(() => ComplaintStatus)
  status: ComplaintStatus;
  @FilterableField(() => ID)
  orderId: number;
}
