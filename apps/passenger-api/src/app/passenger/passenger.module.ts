import { NestjsQueryGraphQLModule } from '@ptc-org/nestjs-query-graphql';
import { Module } from '@nestjs/common';
import { NestjsQueryTypeOrmModule } from '@ptc-org/nestjs-query-typeorm';
import { PassengerEntity } from '@vroom/database/passenger.entity';
import { PassengerDTO } from './dto/passenger.dto';
import { UpdatePassengerInput } from './dto/update-passenger.input';
import { GqlAuthGuard } from '../auth/jwt-gql-auth.guard';
import { PassengerWalletEntity } from '@vroom/database/passenger-wallet.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { SharedPassengerService } from '@vroom/order/shared-passenger.service';
import { PassengerTransactionEntity } from '@vroom/database/passenger-transaction.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([
      PassengerEntity,
      PassengerWalletEntity,
      PassengerTransactionEntity,
    ]),
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([PassengerEntity])],
      resolvers: [
        {
          EntityClass: PassengerEntity,
          DTOClass: PassengerDTO,
          UpdateDTOClass: UpdatePassengerInput,
          read: { many: { disabled: true } },
          create: { disabled: true },
          update: { many: { disabled: true } },
          delete: { disabled: true },
          guards: [GqlAuthGuard],
        },
      ],
    }),
  ],
  providers: [SharedPassengerService],
  exports: [SharedPassengerService],
})
export class PassengerModule {}
