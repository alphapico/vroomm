import { Module } from '@nestjs/common';

import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CryptoModule } from './crypto/crypto.module';
import { PaymentModule } from './payment/payment.module';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigModule } from '@nestjs/config';
import { GatewaysModule } from './gateways/gateways.module';
import { DataSource, DataSourceOptions } from 'typeorm';
import { PaymentGatewayEntity } from './database/payment-gateway.entity';

const databaseConfig: DataSourceOptions = {
  type: 'mysql',
  host: process.env.MYSQL_HOST || 'localhost',
  port: Number(process.env.MYSQL_PORT) || 9306,
  username: process.env.MYSQL_USER || 'root',
  password: process.env.MYSQL_PASS || 'defaultpassword',
};

@Module({
  imports: [
    CryptoModule,
    PaymentModule,
    TypeOrmModule.forRootAsync({
      useFactory: async () => {
        return {
          ...databaseConfig,
          database: process.env.MYSQL_DB_WAVE || 'waves',
          autoLoadEntities: true,
          legacySpatialSupport: false,
          synchronize: false,
          logging: true,
          migrationsRun: false,
        };
      },
    }),
    TypeOrmModule.forFeature([PaymentGatewayEntity]),
    ConfigModule.forRoot(),
    GatewaysModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
