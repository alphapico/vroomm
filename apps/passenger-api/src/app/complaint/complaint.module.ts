import { NestjsQueryGraphQLModule } from '@ptc-org/nestjs-query-graphql';
import { NestjsQueryTypeOrmModule } from '@ptc-org/nestjs-query-typeorm';
import { Module } from '@nestjs/common';
import { ComplaintEntity } from '@vroom/database/complaint.entity';
import { GqlAuthGuard } from '../auth/jwt-gql-auth.guard';
import { ComplaintDTO } from './dto/complaint.dto';
import { ComplaintInput } from './dto/complaint.input';

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([ComplaintEntity])],
      resolvers: [
        {
          EntityClass: ComplaintEntity,
          DTOClass: ComplaintDTO,
          CreateDTOClass: ComplaintInput,
          read: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
          create: { many: { disabled: true } },
          guards: [GqlAuthGuard],
        },
      ],
    }),
  ],
})
export class ComplaintModule {}
