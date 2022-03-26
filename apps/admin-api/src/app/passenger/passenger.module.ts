import {
  NestjsQueryGraphQLModule,
  PagingStrategies,
} from '@ptc-org/nestjs-query-graphql';
import { NestjsQueryTypeOrmModule } from '@ptc-org/nestjs-query-typeorm';
import { Module } from '@nestjs/common';
import { PassengerAddressEntity } from '@vroom/database/passenger-address.entity';
import { PassengerEntity } from '@vroom/database/passenger.entity';
import { PassengerTransactionEntity } from '@vroom/database/passenger-transaction.entity';
import { PassengerWalletEntity } from '@vroom/database/passenger-wallet.entity';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { PassengerAddressDTO } from './dto/passenger-address.dto';

import { PassengerTransactionDTO } from './dto/passenger-transaction.dto';
import { PassengerWalletDTO } from './dto/passenger-wallet.dto';
import { PassengerDTO } from './dto/passenger.dto';
import { PassengerResolver } from './passenger.resolver';

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [
        NestjsQueryTypeOrmModule.forFeature([
          PassengerEntity,
          PassengerWalletEntity,
          PassengerTransactionEntity,
          PassengerAddressEntity,
        ]),
      ],
      resolvers: [
        {
          EntityClass: PassengerEntity,
          DTOClass: PassengerDTO,
          create: { many: { disabled: true } },
          update: { many: { disabled: true } },
          delete: { disabled: true },
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [JwtAuthGuard],
        },
        {
          EntityClass: PassengerWalletEntity,
          DTOClass: PassengerWalletDTO,
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [JwtAuthGuard],
        },
        {
          EntityClass: PassengerTransactionEntity,
          DTOClass: PassengerTransactionDTO,
          create: { many: { disabled: true } },
          update: { disabled: true },
          delete: { disabled: true },
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [JwtAuthGuard],
        },
        {
          EntityClass: PassengerAddressEntity,
          DTOClass: PassengerAddressDTO,
          create: { many: { disabled: true } },
          delete: { disabled: true },
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [JwtAuthGuard],
        },
      ],
    }),
  ],
  providers: [PassengerResolver],
})
export class PassengerModule {}
