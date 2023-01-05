import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { OrderEntity } from '@vroom/database/order.entity';
import { Repository } from 'typeorm';
import { Datapoint, StatisticsResult, TimeQuery } from './dto/earnings.dto';

@Injectable()
export class EarningsService {
  constructor(
    @InjectRepository(OrderEntity)
    private orderRepository: Repository<OrderEntity>
  ) {}

  async getStats(
    driverId: number,
    timeFrame: TimeQuery
  ): Promise<StatisticsResult> {
    const q: Array<any> = await this.orderRepository.query(
      'SELECT currency, COUNT(currency) as count from vroom.order where driverId = ? group by currency order by count desc LIMIT 1',
      [driverId]
    );
    if (q.length < 1) {
      return {
        currency: 'USD',
        dataset: [],
      };
    }
    const mostUsedCurrency: string = q[0].currency;
    let dataset: Datapoint[];
    const fields =
      'SUM(costBest - providerShare) AS earning, COUNT(id) AS count, SUM(distanceBest) AS distance, SUM(durationBest) AS time';
    switch (timeFrame) {
      case TimeQuery.Daily:
        dataset = await this.orderRepository.query(
          `SELECT ANY_VALUE(DATE_FORMAT(orderTimestamp, '%W')) as name, CONCAT(ANY_VALUE(MONTH(CURRENT_TIMESTAMP)),'/',ANY_VALUE(DAY(CURRENT_TIMESTAMP))) AS current, ${fields} from vroom.order WHERE DATEDIFF(NOW(),orderTimestamp) < 7 AND driverId = ? AND currency = ? GROUP BY DATE(orderTimestamp)`,
          [driverId, mostUsedCurrency]
        );
        break;
      case TimeQuery.Weekly:
        dataset = await this.orderRepository.query(
          `SELECT CONCAT(ANY_VALUE(YEAR(orderTimestamp)),',W',ANY_VALUE(WEEK(orderTimestamp))) AS name, CONCAT(ANY_VALUE(YEAR(CURRENT_TIMESTAMP)),',W',ANY_VALUE(WEEK(CURRENT_TIMESTAMP))) AS current, ${fields} FROM vroom.order WHERE driverId = ? AND currency = ? GROUP BY YEAR(orderTimestamp), WEEK(orderTimestamp)`,
          [driverId, mostUsedCurrency]
        );
        break;

      case TimeQuery.Monthly:
        dataset = await this.orderRepository.query(
          `SELECT CONCAT(ANY_VALUE(YEAR(orderTimestamp)),'/',ANY_VALUE(MONTH(orderTimestamp))) AS name, CONCAT(ANY_VALUE(YEAR(CURRENT_TIMESTAMP)),'/',ANY_VALUE(MONTH(CURRENT_TIMESTAMP))) AS current, ${fields} FROM vroom.order WHERE DATE(orderTimestamp) > DATE(MAKEDATE(year(now()),1)) AND driverId = ? AND currency = ? GROUP BY YEAR(orderTimestamp), MONTH(orderTimestamp)`,
          [driverId, mostUsedCurrency]
        );
        break;
    }
    return {
      currency: mostUsedCurrency,
      dataset: dataset,
    };
  }

  async getStatsNew(
    driverId: number,
    timeFrame: TimeQuery,
    startDate: Date,
    endDate: Date
  ): Promise<StatisticsResult> {
    const q: Array<any> = await this.orderRepository.query(
      'SELECT currency, COUNT(currency) as count from vroom.order where driverId = ? group by currency order by count desc LIMIT 1',
      [driverId]
    );
    if (q.length < 1) {
      return {
        currency: 'USD',
        dataset: [],
      };
    }
    const mostUsedCurrency: string = q[0].currency;
    let dataset: Datapoint[];
    const fields =
      'SUM(costBest - providerShare) AS earning, COUNT(id) AS count, SUM(distanceBest) AS distance, SUM(durationBest) AS time';
    switch (timeFrame) {
      case TimeQuery.Daily:
        dataset = await this.orderRepository.query(
          `SELECT ANY_VALUE(DATE_FORMAT(orderTimestamp, '%W')) as name, CONCAT(ANY_VALUE(MONTH(CURRENT_TIMESTAMP)),'/',ANY_VALUE(DAY(CURRENT_TIMESTAMP))) AS current, ${fields} from vroom.order WHERE orderTimestamp > ? AND orderTimestamp < ? AND driverId = ? AND currency = ? GROUP BY DATE(orderTimestamp)`,
          [startDate, endDate, driverId, mostUsedCurrency]
        );
        break;
      case TimeQuery.Weekly:
        dataset = await this.orderRepository.query(
          `SELECT CONCAT(ANY_VALUE(YEAR(orderTimestamp)),',W',ANY_VALUE(WEEK(orderTimestamp))) AS name, CONCAT(ANY_VALUE(YEAR(CURRENT_TIMESTAMP)),',W',ANY_VALUE(WEEK(CURRENT_TIMESTAMP))) AS current, ${fields} FROM vroom.order WHERE orderTimestamp > ? AND orderTimestamp < ? AND driverId = ? AND currency = ? GROUP BY YEAR(orderTimestamp), WEEK(orderTimestamp)`,
          [startDate, endDate, driverId, mostUsedCurrency]
        );
        break;

      case TimeQuery.Monthly:
        dataset = await this.orderRepository.query(
          `SELECT CONCAT(ANY_VALUE(YEAR(orderTimestamp)),'/',ANY_VALUE(MONTH(orderTimestamp))) AS name, CONCAT(ANY_VALUE(YEAR(CURRENT_TIMESTAMP)),'/',ANY_VALUE(MONTH(CURRENT_TIMESTAMP))) AS current, ${fields} FROM vroom.order WHERE orderTimestamp > ? AND orderTimestamp < ? AND driverId = ? AND currency = ? GROUP BY YEAR(orderTimestamp), MONTH(orderTimestamp)`,
          [startDate, endDate, driverId, mostUsedCurrency]
        );
        break;
    }
    return {
      currency: mostUsedCurrency,
      dataset: dataset,
    };
  }
}
