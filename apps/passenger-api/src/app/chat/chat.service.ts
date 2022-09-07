import { QueryService } from '@ptc-org/nestjs-query-core';
import { InjectPubSub } from '@ptc-org/nestjs-query-graphql';
import { TypeOrmQueryService } from '@ptc-org/nestjs-query-typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { OrderMessageEntity } from '@vroom/database/order-message.entity';
import { OrderEntity } from '@vroom/database/order.entity';
import { DriverNotificationService } from '@vroom/order/firebase-notification-service/driver-notification.service';
import { RedisPubSub } from 'graphql-redis-subscriptions';
import { Repository } from 'typeorm';

import { OrderMessageDTO } from './dto/order-message.dto';
import { OrderMessageInput } from './dto/order-message.input';

@QueryService(OrderMessageEntity)
export class ChatService extends TypeOrmQueryService<OrderMessageEntity> {
  constructor(
    @InjectRepository(OrderMessageEntity)
    public repository: Repository<OrderMessageEntity>,
    @InjectRepository(OrderEntity)
    private orderRepository: Repository<OrderEntity>,
    @InjectPubSub()
    private pubSub: RedisPubSub,
    private driverNotificationService: DriverNotificationService
  ) {
    super(repository);
  }

  override async createOne(input: OrderMessageInput) {
    let message = await super.createOne({ ...input, sentByDriver: false });
    const order = await this.orderRepository.findOne({
      relations: { passenger: true, driver: true },
      where: { id: message.orderId },
    });
    message = await this.getById(message.id);
    this.driverNotificationService.message(order.driver, message);
    this.pubSub.publish<{
      newMessageReceived: OrderMessageDTO;
      driverId: number;
    }>('newMessageForDriver', {
      newMessageReceived: message,
      driverId: order.driverId,
    });
    return message;
  }
}
