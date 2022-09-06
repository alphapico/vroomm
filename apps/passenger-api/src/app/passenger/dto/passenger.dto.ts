import { ID, ObjectType } from '@nestjs/graphql';
import {
  Authorize,
  BeforeFindOne,
  FindOneArgsType,
  IDField,
  Relation,
  UnPagedRelation,
} from '@ptc-org/nestjs-query-graphql';
import { Gender } from '@vroom/database/enums/gender.enum';
import { UserContext } from '../../auth/authenticated-user';
import { MediaDTO } from '../../upload/media.dto';
import { CouponDTO } from '../../coupon/dto/coupon.dto';
import { OrderDTO } from '../../order/dto/order.dto';
import { SortDirection } from '@ptc-org/nestjs-query-core';
import { OrderStatus } from '@vroom/database/enums/order-status.enum';
import { PassengerDocumentType } from '@vroom/database/enums/passenger-document-type';

@ObjectType('Passenger')
@Authorize({
  authorize: (context: UserContext) => ({ id: { eq: context.req.user.id } }),
})
@BeforeFindOne((input: FindOneArgsType, context: UserContext) => {
  return { id: context.req.user.id };
})
@Relation('media', () => MediaDTO, {
  nullable: true,
  disableRemove: true,
  disableUpdate: true,
})
@UnPagedRelation('coupons', () => CouponDTO, {
  disableRemove: true,
  disableUpdate: true,
})
@UnPagedRelation('orders', () => OrderDTO, {
  disableRemove: true,
  disableUpdate: true,
  maxResultsSize: 1,
  defaultFilter: {
    status: {
      in: [
        OrderStatus.Requested,
        OrderStatus.Booked,
        OrderStatus.Found,
        OrderStatus.NotFound,
        OrderStatus.NoCloseFound,
        OrderStatus.DriverAccepted,
        OrderStatus.Arrived,
        OrderStatus.Started,
        OrderStatus.WaitingForReview,
        OrderStatus.WaitingForPostPay,
        OrderStatus.WaitingForPrePay,
      ],
    },
  },
  defaultSort: [{ field: 'id', direction: SortDirection.DESC }],
  defaultResultSize: 1,
  enableAggregate: true,
})
export class PassengerDTO {
  @IDField(() => ID)
  id!: number;
  mobileNumber: string;
  firstName?: string;
  lastName?: string;
  email?: string;
  gender?: Gender;
  isResident?: boolean;
  idNumber?: string;
  documentType?: PassengerDocumentType;
}
