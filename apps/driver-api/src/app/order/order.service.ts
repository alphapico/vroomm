import { InjectPubSub } from '@ptc-org/nestjs-query-graphql';
import { Injectable, Logger } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Point } from '@vroom/database';
import { DriverStatus } from '@vroom/database/enums/driver-status.enum';
import { OrderStatus } from '@vroom/database/enums/order-status.enum';
import { OrderActivityType } from '@vroom/database/enums/order-activity-type.enum';
import { OrderActivityEntity } from '@vroom/database/order-activity.entity';
import { OrderEntity } from '@vroom/database/order.entity';
import { SharedDriverService } from '@vroom/order/shared-driver.service';
// import { SharedFleetService } from '@vroom/order/shared-fleet.service';
import { OrderRedisService } from '@vroom/redis/order-redis.service';
import { ForbiddenError } from 'apollo-server-core';
import { RedisPubSub } from 'graphql-redis-subscriptions';
import { In, Repository } from 'typeorm';

@Injectable()
export class OrderService {
  constructor(
    @InjectRepository(OrderEntity)
    public orderRepository: Repository<OrderEntity>,
    @InjectRepository(OrderActivityEntity)
    public activityRepository: Repository<OrderActivityEntity>,
    private driverService: SharedDriverService,
    private orderRedisService: OrderRedisService,
    // private sharedFleetService: SharedFleetService,
    @InjectPubSub()
    private pubSub: RedisPubSub
  ) {}

  async cancelOrder(orderId: number): Promise<OrderEntity> {
    let order = await this.orderRepository.findOne({
      where: { id: orderId },
    });
    const allowedStatuses = [OrderStatus.DriverAccepted, OrderStatus.Arrived];
    if (order == null || !allowedStatuses.includes(order.status)) {
      throw new ForbiddenError('It is not allowed to cancel this order');
    }
    await this.orderRepository.update(order.id, {
      status: OrderStatus.DriverCanceled,
      finishTimestamp: new Date(),
      costAfterCoupon: 0,
    });
    order = await this.orderRepository.findOne({ where: { id: order.id } });
    this.driverService.updateDriverStatus(order.driverId, DriverStatus.Online);
    this.pubSub.publish('orderUpdated', { orderUpdated: order });
    return order;
  }

  async expireOrders(orderIds: number[]) {
    this.orderRedisService.expire(orderIds);
    this.orderRepository.update(orderIds, { status: OrderStatus.Expired });
    for (const orderId of orderIds) {
      this.activityRepository.insert({
        orderId,
        type: OrderActivityType.Expired,
      });
    }
  }

  async getOrdersForDriver(driverId: number): Promise<OrderEntity[]> {
    const driver = await this.driverService.driverRepo.findOne({
      relations: { enabledServices: true },
      where: { id: driverId },
    });
    const orderIds = await this.orderRedisService.getForDriver(
      driverId,
      driver.searchDistance
    );
    const orders = await this.orderRepository.find({
      where: {
        id: In(orderIds),
        serviceId: In(driver.enabledServices.map((service) => service.id)),
      },
      relations: { service: true },
    });
    Logger.log(`found ${JSON.stringify(orders)}`);

    return orders;
  }
}
