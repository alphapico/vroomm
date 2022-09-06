import { forwardRef, Inject, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { CouponEntity } from '@vroom/database/coupon.entity';
import { PassengerRechargeTransactionType } from '@vroom/database/enums/passenger-recharge-transaction-type.enum';
import { TransactionAction } from '@vroom/database/enums/transaction-action.enum';
import { TransactionStatus } from '@vroom/database/enums/transaction-status.enum';
import { GiftCardEntity } from '@vroom/database/gift-card.entity';
import { OrderEntity } from '@vroom/database/order.entity';
import { SharedOrderService } from '@vroom/order/shared-order.service';
import { SharedPassengerService } from '@vroom/order/shared-passenger.service';
import { ForbiddenError } from 'apollo-server-core';
import { Repository } from 'typeorm';
import { PassengerWalletDTO } from '../wallet/dto/passenger-wallet.dto';

@Injectable()
export class CouponService {
  constructor(
    @InjectRepository(CouponEntity)
    private giftCardRepo: Repository<GiftCardEntity>,
    private sharedPassengerService: SharedPassengerService
  ) {}

  async redeemGiftCard(
    code: string,
    passengerId: number
  ): Promise<PassengerWalletDTO> {
    const card = await this.giftCardRepo.findOne({ where: { code } });
    if (card == null) throw new ForbiddenError('Invalid code');
    await this.giftCardRepo.update(card.id, { isUsed: true });
    return this.sharedPassengerService.rechargeWallet({
      passengerId,
      action: TransactionAction.Recharge,
      rechargeType: PassengerRechargeTransactionType.Gift,
      status: TransactionStatus.Done,
      currency: card.currency,
      amount: card.amount,
      giftCardId: card.id,
    });
  }
}
