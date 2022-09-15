import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CryptoService } from '../crypto/crypto.service';
import { PaymentEntity, PaymentStatus } from '../database/payment.entity';

@Injectable()
export class PaymentService {
  constructor(
    @InjectRepository(PaymentEntity)
    public paymentRepository: Repository<PaymentEntity>,
    private cryptoService: CryptoService
  ) {}

  async createRecord(input: {
    transactionNumber: string;
    paymentInterface: PayInterface;
  }) {
    await this.paymentRepository.insert({
      amount: parseFloat(input.paymentInterface.amount),
      currency: input.paymentInterface.currency,
      transactionNumber: input.transactionNumber,
      userId: input.paymentInterface.userId,
      userType: input.paymentInterface.userType,
      gatewayId: input.paymentInterface.paymentGatewayId,
      returnUrl: input.paymentInterface.returnUrl.replace('"', ''),
    });
  }

  async getOne(transactionNumber: string): Promise<PaymentEntity | null> {
    return this.paymentRepository.findOne({
      where: { transactionNumber },
    });
  }

  async getEncryptedWithPayment(payment: PaymentEntity): Promise<string> {
    // const result = `${payment.userType}|${payment.userId}|${new Date().getTime()}|${payment.gatewayId}|${payment.transactionNumber}`;
    const json: DecryptedPaymentResult = {
      status: payment.status,
      userType: payment.userType,
      userId: parseInt(payment.userId),
      timestamp: new Date().getTime(),
      gatewayId: payment.gatewayId,
      transactionNumber: payment.transactionNumber,
      amount: payment.amount,
      currency: payment.currency,
    };
    const str = JSON.stringify(json);
    return this.cryptoService.encrypt(str);
  }

  async updatePaymentStatus(id: number, status: PaymentStatus) {
    await this.paymentRepository.update(id, { status: status });
    return this.paymentRepository.findOne({ where: { id } });
  }
}

export interface DecryptedPaymentResult {
  status: PaymentStatus;
  userType: string;
  userId: number;
  timestamp: number;
  gatewayId: number;
  transactionNumber: string;
  amount: number;
  currency: string;
}

export interface PayInterface {
  userId: string;
  userType: string;
  paymentGatewayId: number;
  amount: string;
  currency: string;
  returnUrl: string;
}
