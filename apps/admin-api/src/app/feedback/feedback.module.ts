import {
  NestjsQueryGraphQLModule,
  PagingStrategies,
} from '@ptc-org/nestjs-query-graphql';
import { NestjsQueryTypeOrmModule } from '@ptc-org/nestjs-query-typeorm';
import { Module } from '@nestjs/common';
import { FeedbackParameterEntity } from '@vroom/database/feedback-parameter.entity';
import { FeedbackEntity } from '@vroom/database/feedback.entity';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { FeedbackParameterDTO } from './dto/feedback-parameter.dto';
import { FeedbackDTO } from './dto/feedback.dto';

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [
        NestjsQueryTypeOrmModule.forFeature([
          FeedbackEntity,
          FeedbackParameterEntity,
        ]),
      ],
      resolvers: [
        {
          EntityClass: FeedbackEntity,
          DTOClass: FeedbackDTO,
          create: { disabled: true },
          update: { many: { disabled: true } },
          delete: { disabled: true },
          pagingStrategy: PagingStrategies.OFFSET,
          enableTotalCount: true,
          guards: [JwtAuthGuard],
        },
        {
          EntityClass: FeedbackParameterEntity,
          DTOClass: FeedbackParameterDTO,
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
export class FeedbackModule {}
