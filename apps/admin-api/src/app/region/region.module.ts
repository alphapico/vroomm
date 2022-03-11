import {
  NestjsQueryGraphQLModule,
  PagingStrategies,
} from '@ptc-org/nestjs-query-graphql';
import { NestjsQueryTypeOrmModule } from '@ptc-org/nestjs-query-typeorm';
import { Module } from '@nestjs/common';
import { RegionEntity } from '@vroom/database/region.entity';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { RegionDTO } from './dto/region.dto';

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([RegionEntity])],
      resolvers: [
        {
          EntityClass: RegionEntity,
          DTOClass: RegionDTO,
          create: { many: { disabled: true } },
          update: { many: { disabled: true } },
          delete: { many: { disabled: true } },
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          enableAggregate: true,
          guards: [JwtAuthGuard],
        },
      ],
    }),
  ],
})
export class RegionModule {}
