import {
  NestjsQueryGraphQLModule,
  PagingStrategies,
} from '@ptc-org/nestjs-query-graphql';
import { NestjsQueryTypeOrmModule } from '@ptc-org/nestjs-query-typeorm';
import { Module } from '@nestjs/common';
import { ComplaintActivityEntity } from '@vroom/database/complaint-activity.entity';
import { ComplaintEntity } from '@vroom/database/complaint.entity';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { ComplaintActivityDTO } from './dto/complaint-activity.dto';
import { ComplaintDTO } from './dto/complaint.dto';

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [
        NestjsQueryTypeOrmModule.forFeature([
          ComplaintEntity,
          ComplaintActivityEntity,
        ]),
      ],
      resolvers: [
        {
          EntityClass: ComplaintEntity,
          DTOClass: ComplaintDTO,
          create: { disabled: true },
          update: { many: { disabled: true } },
          delete: { disabled: true },
          enableAggregate: true,
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [JwtAuthGuard],
        },
        {
          EntityClass: ComplaintActivityEntity,
          DTOClass: ComplaintActivityDTO,
          pagingStrategy: PagingStrategies.NONE,
          update: { disabled: true },
          delete: { disabled: true },
          guards: [JwtAuthGuard],
        },
      ],
    }),
  ],
})
export class ComplaintModule {}
