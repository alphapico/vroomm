import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { PassengerEntity } from '../entities/passenger.entity';
import { PassengerTransactionEntity } from '../entities/passenger-transaction.entity';
import { PassengerWalletEntity } from '../entities/passenger-wallet.entity';
import { Repository } from 'typeorm';

@Injectable()
export class SharedPassengerService {
  constructor(
    @InjectRepository(PassengerEntity)
    private repo: Repository<PassengerEntity>,
    @InjectRepository(PassengerWalletEntity)
    private passengerWalletRepo: Repository<PassengerWalletEntity>,
    @InjectRepository(PassengerTransactionEntity)
    private passengerTransactionRepo: Repository<PassengerTransactionEntity>
  ) {}

  async findById(id: number): Promise<PassengerEntity> {
    return this.repo.findOneOrFail({ where: { id }, withDeleted: true });
  }

  private async findUserByMobileNumber(
    mobileNumber: string
  ): Promise<PassengerEntity | null> {
    return this.repo.findOne({ where: { mobileNumber }, withDeleted: true });
  }

  private async createUserWithMobileNumber(
    mobileNumber: string
  ): Promise<PassengerEntity> {
    const addResult = await this.repo.save({
      mobileNumber: mobileNumber,
    });
    return addResult;
  }

  async findOrCreateUserWithMobileNumber(
    mobileNumber: string
  ): Promise<PassengerEntity> {
    const findResult = await this.findUserByMobileNumber(mobileNumber);
    if (findResult?.deletedAt != null) {
      await this.repo.restore(findResult?.id);
    }
    if (findResult == null) {
      return await this.createUserWithMobileNumber(mobileNumber);
    } else {
      return findResult;
    }
  }

  async deleteById(id: number): Promise<PassengerEntity> {
    const user = await this.findById(id);
    await this.repo.softDelete(id);
    return user;
  }

  async getPassengerCreditInCurrency(passengerId: number, currency: string) {
    const wallet = await this.passengerWalletRepo.findOne({
      where: { passengerId, currency },
    });
    return wallet?.balance ?? 0;
  }

  async rechargeWallet(
    transaction: Pick<
      PassengerTransactionEntity,
      | 'status'
      | 'action'
      | 'rechargeType'
      | 'deductType'
      | 'amount'
      | 'currency'
      | 'passengerId'
      | 'orderId'
      | 'operatorId'
      | 'paymentGatewayId'
      | 'refrenceNumber'
      | 'description'
    >
  ): Promise<PassengerWalletEntity> {
    let wallet = await this.passengerWalletRepo.findOne({
      where: {
        passengerId: transaction.passengerId,
        currency: transaction.currency,
      },
    });
    if (wallet == null) {
      wallet = await this.passengerWalletRepo.save({
        balance: transaction.amount,
        currency: transaction.currency,
        passengerId: transaction.passengerId,
      });
    } else {
      await this.passengerWalletRepo.update(wallet.id, {
        balance: transaction.amount + wallet.balance,
      });
      wallet.balance += transaction.amount;
    }
    this.passengerTransactionRepo.save(transaction);
    return wallet;
  }
}
