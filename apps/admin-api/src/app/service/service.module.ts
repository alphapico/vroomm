import {
  NestjsQueryGraphQLModule,
  PagingStrategies,
} from '@ptc-org/nestjs-query-graphql';
import { NestjsQueryTypeOrmModule } from '@ptc-org/nestjs-query-typeorm';
import { Module } from '@nestjs/common';
import { ServiceCategoryEntity } from '@vroom/database/service-category.entity';
import { ServiceEntity } from '@vroom/database/service.entity';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { ServiceCategoryDTO } from './dto/service-category.dto';
import { ServiceDTO } from './dto/service.dto';

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [
        NestjsQueryTypeOrmModule.forFeature([
          ServiceCategoryEntity,
          ServiceEntity,
        ]),
      ],
      resolvers: [
        {
          EntityClass: ServiceEntity,
          DTOClass: ServiceDTO,
          create: { many: { disabled: true } },
          update: { many: { disabled: true } },
          delete: { many: { disabled: true } },
          pagingStrategy: PagingStrategies.NONE,
          guards: [JwtAuthGuard],
        },
        {
          EntityClass: ServiceCategoryEntity,
          DTOClass: ServiceCategoryDTO,
          create: { many: { disabled: true } },
          update: { many: { disabled: true } },
          delete: { many: { disabled: true } },
          pagingStrategy: PagingStrategies.NONE,
          guards: [JwtAuthGuard],
        },
      ],
    }),
  ],
})
export class ServiceModule {}
