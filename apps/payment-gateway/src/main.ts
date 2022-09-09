import { Logger } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app/app.module';
import {
  FastifyAdapter,
  NestFastifyApplication,
} from '@nestjs/platform-fastify';

async function bootstrap() {
  const adapter = new FastifyAdapter();
  const app = await NestFactory.create<NestFastifyApplication>(
    AppModule,
    adapter
  );
  const port = process.env.GATEWAY_API_PORT || 3333;
  app.enableCors();
  await app.listen(port, '0.0.0.0', () => {
    Logger.log('Listening at http://localhost:' + port);
  });
}

bootstrap();
