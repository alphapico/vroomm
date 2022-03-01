import { ConsoleLogger, Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DataSource, DataSourceOptions } from 'typeorm';
import { OperatorRoleEntity } from './entities/operator-role.entity';
import { OperatorEntity } from './entities/operator.entity';

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

export const entities = [OperatorEntity, OperatorRoleEntity];
