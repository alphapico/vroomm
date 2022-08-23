import {
  NestjsQueryGraphQLModule,
  PagingStrategies,
} from '@ptc-org/nestjs-query-graphql';
import { NestjsQueryTypeOrmModule } from '@ptc-org/nestjs-query-typeorm';
import { Module } from '@nestjs/common';
import { PassengerAddressEntity } from '@vroom/database/passenger-address.entity';

import { GqlAuthGuard } from '../auth/jwt-gql-auth.guard';
import { CreatePassengerAddressInput } from './dto/create-passenger-address.input';
import { PassengerAddressDTO } from './dto/passenger-address.dto';

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([PassengerAddressEntity])],
      resolvers: [
        {
          EntityClass: PassengerAddressEntity,
          DTOClass: PassengerAddressDTO,
          CreateDTOClass: CreatePassengerAddressInput,
          UpdateDTOClass: CreatePassengerAddressInput,
          create: { many: { disabled: true } },
          update: { many: { disabled: true } },
          delete: { many: { disabled: true } },
          guards: [GqlAuthGuard],
          pagingStrategy: PagingStrategies.NONE,
        },
      ],
    }),
  ],
})
export class AddressModule {}
