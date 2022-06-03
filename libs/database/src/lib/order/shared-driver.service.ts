import { Injectable, Logger } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { In, Repository } from 'typeorm';

import { DriverTransactionEntity } from '../entities/driver-transaction.entity';
import { DriverWalletEntity } from '../entities/driver-wallet.entity';
import { DriverEntity } from '../entities/driver.entity';
import { DriverStatus } from '../entities/enums/driver-status.enum';

@Injectable()
export class SharedDriverService {
  constructor(
    @InjectRepository(DriverEntity)
    public driverRepo: Repository<DriverEntity>,
    @InjectRepository(DriverWalletEntity)
    private driverWalletRepo: Repository<DriverWalletEntity>,
    @InjectRepository(DriverTransactionEntity)
    private driverTransactionRepo: Repository<DriverTransactionEntity>
  ) {}

  async updateDriverStatus(driverId: number, status: DriverStatus) {
    return this.driverRepo.update(driverId, { status });
  }

  async getMaxRadiusForDriverServices(driverId: number): Promise<number> {
    // const driver = await this.driverRepo.findOne(driverId, { relations: ['enabledServices']});
    const driver = await this.driverRepo.findOne({
      relations: { enabledServices: true },
      where: { id: driverId },
    });
    const radiuses = driver?.enabledServices.map(
      (service) => service.searchRadius
    ) || [0];
    const max = Math.max(...radiuses);
    return max > 0 ? max : 0;
  }

  async getOnlineDriversWithServiceId(driverIds: number[], serviceId: number) {
    const driversWithService = await this.driverRepo.find({
      where: {
        id: In(driverIds),
        status: DriverStatus.Online,
      },
      relations: { enabledServices: true },
    });
    return driversWithService.filter((x) =>
      x.enabledServices.map((y) => y.id).includes(serviceId)
    );
  }

  async canDriverDoServiceAndFleet(
    driverId: number,
    serviceId: number
  ): Promise<boolean> {
    return (
      (await this.getOnlineDriversWithServiceId([driverId], serviceId)).length >
      0
    );
  }

  async rechargeWallet(
    transaction: Pick<
      DriverTransactionEntity,
      | 'status'
      | 'action'
      | 'rechargeType'
      | 'deductType'
      | 'amount'
      | 'currency'
      | 'driverId'
      | 'orderId'
      | 'operatorId'
      | 'paymentGatewayId'
      | 'refrenceNumber'
      | 'description'
    >
  ) {
    let wallet = await this.driverWalletRepo.findOneBy({
      driverId: transaction.driverId,
      currency: transaction.currency,
    });
    transaction.amount = parseFloat(transaction.amount.toString());
    if (wallet == null) {
      wallet = await this.driverWalletRepo.save({
        balance: transaction.amount,
        currency: transaction.currency,
        driverId: transaction.driverId,
      });
    } else {
      await this.driverWalletRepo.update(wallet.id, {
        balance:
          parseFloat(transaction.amount.toString()) +
          parseFloat(wallet.balance.toString()),
      });
      wallet.balance += transaction.amount;
    }
    if (transaction.amount != 0) {
      Logger.log(`Saving transaction ${JSON.stringify(transaction)}`);
      this.driverTransactionRepo.save(transaction);
    }
    return wallet;
  }
}
