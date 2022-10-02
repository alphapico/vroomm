import { Field, ID, Int, ObjectType } from '@nestjs/graphql';
import {
  Authorize,
  BeforeFindOne,
  BeforeFindOneHook,
  FindOneArgsType,
  IDField,
  OffsetConnection,
  Relation,
  UnPagedRelation,
} from '@ptc-org/nestjs-query-graphql';
import { Gender } from '@vroom/database/enums/gender.enum';
import { DriverStatus } from '@vroom/database/enums/driver-status.enum';
import { UserContext } from '../../auth/authenticated-user';
import { CarModelDTO } from './car-model.dto';
import { CarColorDTO } from './car-color.dto';
import { OrderDTO } from '../../order/dto/order.dto';
import { SortDirection } from '@ptc-org/nestjs-query-core';
import { OrderStatus } from '@vroom/database/enums/order-status.enum';
import { MediaDTO } from '../../upload/media.dto';
import { DriverWalletDTO } from '../../wallet/dto/driver-wallet.dto';

@ObjectType('Driver')
@Authorize({
  authorize: (context: UserContext) => ({ id: { eq: context.req.user.id } }),
})
@BeforeFindOne((input: FindOneArgsType, context: UserContext) => {
  return { id: context.req.user.id };
})
@UnPagedRelation('documents', () => MediaDTO, { disableRemove: true })
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
@OffsetConnection('orders', () => OrderDTO, {
  maxResultsSize: 1,
  defaultFilter: {
    status: {
      in: [
        OrderStatus.DriverAccepted,
        OrderStatus.Arrived,
        OrderStatus.Started,
        OrderStatus.WaitingForPostPay,
      ],
    },
  },
  defaultSort: [{ field: 'id', direction: SortDirection.DESC }],
  defaultResultSize: 1,
  disableRemove: true,
  disableUpdate: true,
})
@UnPagedRelation('currentOrders', () => OrderDTO, {
  maxResultsSize: 1,
  defaultFilter: {
    status: {
      in: [
        OrderStatus.DriverAccepted,
        OrderStatus.Arrived,
        OrderStatus.Started,
        OrderStatus.WaitingForPostPay,
      ],
    },
  },
  defaultSort: [{ field: 'id', direction: SortDirection.DESC }],
  defaultResultSize: 1,
  relationName: 'orders',
  disableRemove: true,
  disableUpdate: true,
})
@UnPagedRelation('wallet', () => DriverWalletDTO, {
  relationName: 'wallet',
  disableRemove: true,
  disableUpdate: true,
})
export class DriverDTO {
  @IDField(() => ID)
  id!: number;
  @Field({ nullable: true })
  firstName?: string;
  @Field({ nullable: true })
  lastName?: string;
  @Field()
  mobileNumber: string;
  @Field({ nullable: true })
  certificateNumber?: string;
  @Field({ nullable: true })
  email?: string;
  @Field(() => Int, { nullable: true })
  carProductionYear?: number;
  @Field({ nullable: true })
  carPlate?: string;
  @Field(() => DriverStatus)
  status!: DriverStatus;
  @Field(() => Gender, { nullable: true })
  gender?: Gender;
  @Field()
  registrationTimestamp!: Date;
  @Field({ nullable: true })
  lastSeenTimestamp?: Date;
  @Field({ nullable: true })
  accountNumber?: string;
  @Field({ nullable: true })
  bankName?: string;
  @Field({ nullable: true })
  bankRoutingNumber?: string;
  @Field({ nullable: true })
  bankSwift?: string;
  @Field({ nullable: true })
  address?: string;
  @Field({ nullable: true })
  softRejectionNote?: string;
  @Field(() => ID, { nullable: true })
  carModelId?: number;
  @Field(() => ID, { nullable: true })
  carColorId?: number;
  @Field(() => Int, { nullable: true })
  searchDistance?: number;
}
