import { DataSource, DataSourceOptions } from 'typeorm';
import { config } from 'dotenv';
import { join } from 'path';

config({ path: '../../.serve.env' });

const { MYSQL_HOST, MYSQL_USER, MYSQL_PASS, MYSQL_PORT, MYSQL_DB_WAVE } =
  process.env;

export default new DataSource({
  type: 'mysql',
  host: MYSQL_HOST,
  port: Number(MYSQL_PORT),
  username: MYSQL_USER,
  password: MYSQL_PASS,
  database: MYSQL_DB_WAVE,
  entities: [join(__dirname, 'src/app/database/*.entity.{ts,js}')],
  migrations: [join(__dirname, 'src/migration/*{.ts,.js}')],
  synchronize: false,
} as DataSourceOptions);
