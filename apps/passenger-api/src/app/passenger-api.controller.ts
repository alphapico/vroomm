import {
  Controller,
  Get,
  Post,
  Req,
  Res,
  UseGuards,
  Request,
  Logger,
} from '@nestjs/common';
import { PassengerRechargeTransactionType } from '@vroom/database/enums/passenger-recharge-transaction-type.enum';
import { TransactionAction } from '@vroom/database/enums/transaction-action.enum';
import { TransactionStatus } from '@vroom/database/enums/transaction-status.enum';
import { SharedPassengerService } from '@vroom/order/shared-passenger.service';
import { FastifyReply, FastifyRequest } from 'fastify';
import * as fastify from 'fastify';
import { join } from 'path';
import { pipeline } from 'stream';
import { promisify } from 'util';
import { createWriteStream, promises } from 'fs';

const pump = promisify(pipeline);

import { RestJwtAuthGuard } from './auth/rest-jwt-auth.guard';
import { InjectRepository } from '@nestjs/typeorm';
import { PassengerEntity } from '@vroom/database/passenger.entity';
import { Repository } from 'typeorm';
import { MediaEntity } from '@vroom/database/media.entity';
import { CryptoService } from '@vroom/database';
import { PassengerOrderService } from './order/passenger-order.service';
import { SharedOrderService } from '@vroom/order/shared-order.service';
import { InjectPubSub } from '@ptc-org/nestjs-query-graphql';
import { RedisPubSub } from 'graphql-redis-subscriptions';
import { OrderStatus } from '@vroom/database/enums/order-status.enum';

@Controller()
export class PassengerAPIController {
  constructor(
    private sharedPassengerService: SharedPassengerService,
    private sharedOrderService: SharedOrderService,
    private passengerOrderService: PassengerOrderService,
    private cryptoService: CryptoService,
    @InjectPubSub()
    private pubSub: RedisPubSub,
    @InjectRepository(PassengerEntity)
    private passengerRepository: Repository<PassengerEntity>,
    @InjectRepository(MediaEntity)
    private mediaRepository: Repository<MediaEntity>
  ) {}

  @Get()
  async defaultPath(@Res() res: fastify.FastifyReply) {
    res.send('✅ Passenger API microservice running.');
  }

  @Get('payment_result')
  async verifyPayment(
    @Req() req: FastifyRequest<{ Querystring: { token: string } }>,
    @Res() res: FastifyReply
  ) {
    const token = req.query.token;
    const decrypted = await this.cryptoService.decrypt(token);
    Logger.log('Payment:' + JSON.stringify(decrypted));

    if (decrypted.userType == 'client') {
      if (decrypted.status == 'success') {
        await this.sharedPassengerService.rechargeWallet({
          passengerId: decrypted.userId,
          amount: decrypted.amount,
          currency: decrypted.currency,
          refrenceNumber: decrypted.transactionNumber,
          action: TransactionAction.Recharge,
          rechargeType: PassengerRechargeTransactionType.InAppPayment,
          paymentGatewayId: decrypted.gatewayId,
          status: TransactionStatus.Done,
        });
        const order = await this.passengerOrderService.getCurrentOrder(
          decrypted.userId
        );
        if (order?.status == OrderStatus.WaitingForPostPay) {
          await this.sharedOrderService.finish(order.id);
          this.pubSub.publish('orderUpdated', { orderUpdated: order });
        } else if (order?.status == OrderStatus.WaitingForPrePay) {
          this.pubSub.publish('orderUpdated', { orderUpdated: order });
        }
        res.send(
          'Transaction successful. Close this page and go back to the app.'
        );
      } else {
        //res.code(301).redirect(301, 'passengerapppayment://')
        res.send(
          "Transaction wasn't successful. You can go back to the app and redo this."
        );
      }
    }
  }

  @Get('success_message')
  async successMessage(
    @Req()
    req: FastifyRequest<{
      Querystring: { id_order: string };
      Body: { posted_data: string };
    }>,
    @Res() res: FastifyReply
  ) {
    res.send('Transaction successful. Close this page and go back to the app.');
  }

  @Post('upload_profile')
  @UseGuards(RestJwtAuthGuard)
  async upload(@Request() req: any, @Res() res: fastify.FastifyReply) {
    const data = await req.file();
    const dir = 'uploads';
    await promises.mkdir(dir, { recursive: true });
    const _fileName = join(dir, `${new Date().getTime()}-${data.filename}`);
    await pump(data.file, createWriteStream(_fileName));
    const insert = await this.mediaRepository.insert({ address: _fileName });
    await this.passengerRepository.update((req as unknown as any).user.id, {
      mediaId: insert.raw.insertId,
    });
    res.code(200).send({ id: insert.raw.insertId, address: _fileName });
  }
}
