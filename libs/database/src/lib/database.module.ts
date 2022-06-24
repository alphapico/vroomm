import { ConsoleLogger, Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DataSource, DataSourceOptions } from 'typeorm';
import { ConnectionOptions, createConnection } from 'typeorm';
import { CarColorEntity } from './entities/car-color.entity';
import { CarModelEntity } from './entities/car-model.entity';
import { CouponEntity } from './entities/coupon.entity';
import { DriverTransactionEntity } from './entities/driver-transaction.entity';
import { DriverWalletEntity } from './entities/driver-wallet.entity';
import { DriverEntity } from './entities/driver.entity';
import { FeedbackParameterEntity } from './entities/feedback-parameter.entity';
import { FeedbackEntity } from './entities/feedback.entity';
import { MediaEntity } from './entities/media.entity';
import { OperatorRoleEntity } from './entities/operator-role.entity';
import { OperatorEntity } from './entities/operator.entity';
import { RegionEntity } from './entities/region.entity';
import { PassengerAddressEntity } from './entities/passenger-address.entity';
import { PassengerEntity } from './entities/passenger.entity';
import { PassengerTransactionEntity } from './entities/passenger-transaction.entity';
import { PassengerWalletEntity } from './entities/passenger-wallet.entity';
import { PaymentEntity } from './entities/payment.entity';
import { PaymentGatewayEntity } from './entities/payment-gateway.entity';
import { ServiceCategoryEntity } from './entities/service-category.entity';
import { ServiceOptionEntity } from './entities/service-option.entity';
import { ServiceEntity } from './entities/service.entity';
import { OrderEntity } from './entities/order.entity';
import { OrderMessageEntity } from './entities/order-message.entity';

const databaseConfig: DataSourceOptions = {
  type: 'mysql',
  host: process.env.MYSQL_HOST || 'localhost',
  port: Number(process.env.MYSQL_PORT) || 9306,
  username: process.env.MYSQL_USER || 'root',
  password: process.env.MYSQL_PASS || 'defaultpassword',
};

@Module({
  imports: [
    TypeOrmModule.forRootAsync({
      useFactory: async () => {
        // const dataSource = await new DataSource({
        //   ...databaseConfig,
        //   name: 'ts',
        // }).initialize();
        // let shouldSync = false;
        // if (dataSource.isInitialized) {
        //   const result = await dataSource.query(
        //     `SHOW DATABASES LIKE '${process.env.MYSQL_DB || 'vroom'}';`
        //   );
        //   console.log('[TypeOrmModule.forRootAsync]');
        //   console.log(result);
        //   shouldSync =
        //     (result as unknown[]).length < 1 ||
        //     process.env.FORCE_SYNC_DB != null;
        //   if ((result as unknown[]).length == 0) {
        //     await dataSource.query(
        //       `CREATE DATABASE IF NOT EXISTS ${process.env.MYSQL_DB || 'vroom'}`
        //     );
        //   }
        // }

        // dataSource.destroy();

        return {
          ...databaseConfig,
          database: process.env.MYSQL_DB || 'vroom',
          autoLoadEntities: true,
          legacySpatialSupport: false,
          // migrations: ['./migration/*{.js,.ts}'],
          // entities: [`${__dirname}/entities/*.entity.{ts,js}`],
          synchronize: false,
          logging: true,
          migrationsRun: false,
        };
      },
      // dataSourceFactory: async (options) => {
      //   console.log('[options]');
      //   console.log(options);

      //   if (!options) {
      //     options = {
      //       ...databaseConfig,
      //       name: 'ts',
      //       legacySpatialSupport: false,
      //       migrations: [`${__dirname}/migration/*.js`],
      //       migrationsRun: false,
      //     };
      //   }
      //   const dataSource = await new DataSource(options).initialize();
      //   // const conn = await dataSource.initialize();

      //   let shouldSync = false;
      //   if (dataSource.isInitialized) {
      //     const result = await dataSource.query(
      //       `SHOW DATABASES LIKE '${process.env.MYSQL_DB || 'vroom'}';`
      //     );
      //     console.log('[TypeOrmModule.forRootAsync]');
      //     console.log(result);
      //     shouldSync =
      //       (result as unknown[]).length < 1 ||
      //       process.env.FORCE_SYNC_DB != null;
      //     if ((result as unknown[]).length == 0) {
      //       await dataSource.query(
      //         `CREATE DATABASE IF NOT EXISTS ${process.env.MYSQL_DB || 'vroom'}`
      //       );
      //     }
      //   }

      //   dataSource.setOptions({
      //     ...databaseConfig,
      //     name: 'ts',
      //     legacySpatialSupport: false,
      //     migrations: [`${__dirname}/migration/*.js`],
      //     migrationsRun: false,
      //     database: process.env.MYSQL_DB || 'vroom',
      //     synchronize: shouldSync,
      //   });

      //   return dataSource;
      // },
    }),
  ],
  controllers: [],
  providers: [],
  exports: [],
})
export class DatabaseModule {
  // async onModuleInit() {
  //   const conn =  new DataSource({
  //     name: 'mg', //mg - migrate
  //     type: 'mysql',
  //     host: process.env.MYSQL_HOST || 'localhost',
  //     port: 9306,
  //     username: process.env.MYSQL_USER || 'root',
  //     password: process.env.MYSQL_PASS || 'defaultpassword',
  //     database: process.env.MYSQL_DB || 'vroom',
  //     migrations: [`${__dirname}/migration/*.js`],
  //     migrationsRun: true,
  //   });
  //   const migrationsOutput = await conn.runMigrations();
  //   Logger.log(`${migrationsOutput.length} Migrations done!`);
  // }
}

export const entities = [
  CarModelEntity,
  CarColorEntity,
  CouponEntity,
  DriverEntity,
  DriverTransactionEntity,
  DriverWalletEntity,
  FeedbackParameterEntity,
  FeedbackEntity,
  MediaEntity,
  OperatorEntity,
  OperatorRoleEntity,
  OrderEntity,
  OrderMessageEntity,
  RegionEntity,
  PassengerEntity,
  PassengerWalletEntity,
  PassengerTransactionEntity,
  PassengerAddressEntity,
  PaymentEntity,
  PaymentGatewayEntity,
  ServiceEntity,
  ServiceCategoryEntity,
  ServiceOptionEntity,
];
