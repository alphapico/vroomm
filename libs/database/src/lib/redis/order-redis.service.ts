import { Injectable } from '@nestjs/common';
import { OrderEntity } from '../entities/order.entity';
import { InjectRedis } from '@liaoliaots/nestjs-redis';
import { Redis } from 'ioredis';
import { SharedDriverService } from '../order/shared-driver.service';
import { DriverEntity } from '../entities/driver.entity';

@Injectable()
export class OrderRedisService {
  constructor(
    @InjectRedis() private readonly redisService: Redis,
    private sharedDriverService: SharedDriverService
  ) {}

  async add(
    order: RequestRedisDTO,
    minutesfromNow: number
  ): Promise<RequestRedisDTO> {
    const date = new Date();
    const pickupTime = date.setMinutes(date.getMinutes() + minutesfromNow);
    await this.redisService.geoadd(
      RedisKeys.Request,
      order.points[0].lng,
      order.points[0].lat,
      order.id.toString()
    );
    await this.redisService.zadd(RedisKeys.RequestTime, pickupTime, order.id);
    // await this.redisService.set(`${RedisKeys.Request}:${order.id}`, JSON.stringify(order));
    return order;
  }

  async getForDriver(
    driverId: number,
    distance?: number
  ): Promise<Array<string>> {
    const driverLocation = await this.redisService.geopos(
      RedisKeys.Driver,
      driverId.toString()
    );
    if (driverLocation[0] == null) {
      return [];
    }
    const searchArea =
      distance ??
      (await this.sharedDriverService.getMaxRadiusForDriverServices(driverId));
    const orderIds = await this.redisService.georadius(
      RedisKeys.Request,
      parseFloat(driverLocation[0][0]),
      parseFloat(driverLocation[0][1]),
      searchArea,
      'm'
    );
    // const orders = [];
    const ts = Math.round(new Date().getTime());
    const min = ts - 20 * 60000;
    const max = ts + 30 * 60000;
    const _orders = await this.redisService.zrangebyscore(
      RedisKeys.RequestTime,
      min,
      max
    );
    const intersection = orderIds.filter((x) => _orders.includes(x as string));
    return <Array<string>>intersection;
    // for (const orderId of intersection) {
    //     const orderString = await this.redisService.get(`${RedisKeys.Request}:${orderId}`);
    //     const order: RequestRedisDTO = JSON.parse(orderString!);

    //     if (order) {
    //         const canDo = await this.sharedDriverService.canDriverDoServiceAndFleet(driverId, order.serviceId, order.fleetIds);
    //         if(canDo) {
    //             orders.push(order);
    //         }
    //     }
    // }
    // return orders;
  }

  async driverNotified(orderId: number, driverIds: DriverEntity[]) {
    const ids = driverIds.map((driverId) => driverId.id);
    // shortcut way
    // await this.redisService.sadd(`${RedisKeys.RequestDrivers}:${orderId}`, ...ids);
    for (const id of ids) {
      await this.redisService.sadd(
        `${RedisKeys.RequestDrivers}:${orderId}`,
        id
      );
    }
  }

  async getDriversNotified(orderId: number): Promise<Array<number>> {
    const driverIds = await this.redisService.smembers(
      `${RedisKeys.RequestDrivers}:${orderId}`
    );
    return driverIds.map((x: string) => parseInt(x));
  }

  async expire(orderIds: number[]) {
    for (const orderId of orderIds) {
      await this.redisService.zrem(RedisKeys.Request, orderId);
      await this.redisService.zrem(RedisKeys.RequestTime, orderId);
      const driversNotified = await this.getDriversNotified(orderId);
      // await this.redisService.srem(
      //   `${RedisKeys.RequestDrivers}:${orderId}`,
      //   ...driversNotified
      // );
      for (const driver of driversNotified) {
        await this.redisService.srem(
          `${RedisKeys.RequestDrivers}:${orderId}`,
          driver
        );
      }
      this.redisService.del(`${RedisKeys.Request}:${orderId}`);
    }
    //this.redisService.del(orderIds.map(id => (`${RedisKeys.Request}:${id}`)).join(' ')); // # This doesn't works for some reason. expire works
  }

  async getAll(): Promise<string[]> {
    return this.getOrdersInTimeRange(0, -1);
  }

  async getOrderIdsInTimeRage(min: number, max: number) {
    return await this.redisService.zrange(RedisKeys.RequestTime, min, max);
  }

  async getOrdersInTimeRange(min: number, max: number): Promise<string[]> {
    const _orderIds = await this.getOrderIdsInTimeRage(min, max);
    return _orderIds;
    // const result: RequestRedisDTO[] = []
    // for(const orderId of _orderIds) {
    //     const order = await this.getOne(orderId);
    //     if(order != null) {
    //         result.push(order);
    //     }
    // }
    // return result;
  }

  // async getOne(orderId: number | string): Promise<RequestRedisDTO | null> {
  //     const str = await this.redisService.get(`${RedisKeys.Request}:${orderId}`);
  //     if(str == null) return null;
  //     return JSON.parse(str);

  // }
}

enum RedisKeys {
  Driver = 'driver',
  Request = 'request',
  RequestDrivers = 'request-drivers',
  RequestTime = 'request-time',
}

export type RequestRedisDTO = Pick<
  OrderEntity,
  | 'id'
  | 'expectedTimestamp'
  | 'currency'
  | 'addresses'
  | 'points'
  | 'distanceBest'
  | 'durationBest'
  | 'costBest'
  | 'serviceId'
  | 'createdOn'
  | 'status'
>;
