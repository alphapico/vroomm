import {
  NestjsQueryGraphQLModule,
  PagingStrategies,
} from '@ptc-org/nestjs-query-graphql';
import { NestjsQueryTypeOrmModule } from '@ptc-org/nestjs-query-typeorm';
import { Global, Module } from '@nestjs/common';
import { OperatorRoleEntity } from '@vroom/database/operator-role.entity';
import { OperatorEntity } from '@vroom/database/operator.entity';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { OperatorRoleDTO } from './dto/operator-role.dto';
import { OperatorDTO } from './dto/operator.dto';
import { CreateOperatorInput } from './dto/create-operator.input';
import { OperatorService } from './operator.service';
import { OperatorResolver } from './operator.resolver';
import { OperatorAuthorizer } from './operator.authorizer';

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [
        NestjsQueryTypeOrmModule.forFeature([
          OperatorEntity,
          OperatorRoleEntity,
        ]),
      ],
      resolvers: [
        {
          EntityClass: OperatorRoleEntity,
          DTOClass: OperatorRoleDTO,
          create: { many: { disabled: true } },
          update: { many: { disabled: true } },
          delete: { disabled: true },
          pagingStrategy: PagingStrategies.NONE,
          guards: [JwtAuthGuard],
        },
        {
          EntityClass: OperatorEntity,
          DTOClass: OperatorDTO,
          CreateDTOClass: CreateOperatorInput,
          create: { many: { disabled: true } },
          update: { many: { disabled: true } },
          delete: { disabled: true },
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [JwtAuthGuard],
        },
      ],
    }),
  ],
  providers: [OperatorService, OperatorResolver],
  exports: [OperatorService],
})
export class OperatorModule {}
