import { QueryService } from '@ptc-org/nestjs-query-core';
import { InjectPubSub } from '@ptc-org/nestjs-query-graphql';
import { TypeOrmQueryService } from '@ptc-org/nestjs-query-typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { OrderMessageEntity } from '@vroom/database/order-message.entity';
import { OrderEntity } from '@vroom/database/order.entity';
import { PassengerNotificationService } from '@vroom/order/firebase-notification-service/passenger-notification.service';
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
    private passengerNotificationService: PassengerNotificationService
  ) {
    super(repository);
  }

  override async createOne(input: OrderMessageInput) {
    let message = await super.createOne({ ...input, sentByDriver: true });
    const order = await this.orderRepository.findOne({
      relations: { passenger: true, driver: true },
      where: { id: message.orderId },
    });
    message = await this.getById(message.id);
    this.passengerNotificationService.message(order.passenger, message);
    this.pubSub.publish<{
      newMessageReceived: OrderMessageDTO;
      passengerId: number;
    }>('newMessageForPassenger', {
      newMessageReceived: message,
      passengerId: order.passengerId,
    });
    return message;
  }
}
