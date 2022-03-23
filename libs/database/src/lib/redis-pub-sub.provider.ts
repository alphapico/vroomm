import { pubSubToken } from '@ptc-org/nestjs-query-graphql';
import { RedisPubSub } from 'graphql-redis-subscriptions';
import Redis from 'ioredis';
import { Provider } from '@nestjs/common';

export class RedisPubSubProvider {
  static provider(): Provider {
    return {
      provide: pubSubToken(),
      useFactory: () => {
        const options = {
          port: Number(process.env.REDIS_PORT) || 6379,
          host: process.env.REDIS_HOST || 'localhost',
          password: process.env.REDIS_PASS || '',
        };
        return new RedisPubSub({
          publisher: new Redis(options),
          subscriber: new Redis(options),
        });
      },
    };
  }
}
