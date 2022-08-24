import {
  NestjsQueryGraphQLModule,
  PagingStrategies,
} from '@ptc-org/nestjs-query-graphql';
import { NestjsQueryTypeOrmModule } from '@ptc-org/nestjs-query-typeorm';
import { Module } from '@nestjs/common';
import { PaymentGatewayEntity } from '@vroom/database/payment-gateway.entity';
import { PassengerTransactionEntity } from '@vroom/database/passenger-transaction.entity';
import { PassengerWalletEntity } from '@vroom/database/passenger-wallet.entity';
import { GqlAuthGuard } from '../auth/jwt-gql-auth.guard';
import { PaymentGatewayDTO } from './dto/payment-gateway.dto';
import { PassengerTransactionDTO } from './dto/passenger-transaction.dto';
import { PassengerWalletDTO } from './dto/passenger-wallet.dto';
import { WalletResolver } from './wallet-resolver';

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [
        NestjsQueryTypeOrmModule.forFeature([
          PassengerTransactionEntity,
          PassengerWalletEntity,
          PaymentGatewayEntity,
        ]),
      ],
      resolvers: [
        {
          EntityClass: PassengerTransactionEntity,
          DTOClass: PassengerTransactionDTO,
          read: { one: { disabled: true } },
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
          guards: [GqlAuthGuard],
        },
        {
          EntityClass: PassengerWalletEntity,
          DTOClass: PassengerWalletDTO,
          read: { one: { disabled: true } },
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
          guards: [GqlAuthGuard],
          pagingStrategy: PagingStrategies.NONE,
        },
        {
          EntityClass: PaymentGatewayEntity,
          DTOClass: PaymentGatewayDTO,
          read: { one: { disabled: true } },
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
          pagingStrategy: PagingStrategies.NONE,
        },
      ],
    }),
  ],
  providers: [WalletResolver],
})
export class WalletModule {}
