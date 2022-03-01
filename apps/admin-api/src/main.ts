/**
 * This is not a production server yet!
 * This is only a minimal backend to get started.
 */

import { Logger } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import {
  FastifyAdapter,
  NestFastifyApplication,
} from '@nestjs/platform-fastify';
import fastifyStatic from 'fastify-static';
import fastifyMultipart from 'fastify-multipart';
import fastifyCors from 'fastify-cors';
import { join } from 'path';

// import { AppModule } from './app/app.module';
import { AdminAPIModule } from './app/admin-api.module';

async function bootstrap() {
  const adapter = new FastifyAdapter();
  const app = await NestFactory.create<NestFastifyApplication>(
    AdminAPIModule.register(),
    adapter
  );
  // const globalPrefix = 'api';
  // app.setGlobalPrefix(globalPrefix);
  const port = process.env.ADMIN_API_PORT || 7001;
  app.register(fastifyCors);
  app.register(fastifyMultipart);
  app.register(fastifyStatic, {
    prefix: '/uploads/',
    root: join(process.cwd(), 'uploads'),
  });
  await app.listen(port, '0.0.0.0', () => {
    Logger.log(`Listening at http://localhost:${port}`, 'Admin API');
  });
  // await app.listen(port);
  // Logger.log(
  //   `🚀 Application is running on: http://localhost:${port}/${globalPrefix}`
  // );
}

bootstrap();
