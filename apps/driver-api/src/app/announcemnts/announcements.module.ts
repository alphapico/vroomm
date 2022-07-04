import { NestjsQueryGraphQLModule } from '@ptc-org/nestjs-query-graphql';
import { NestjsQueryTypeOrmModule } from '@ptc-org/nestjs-query-typeorm';
import { Module } from '@nestjs/common';
import { AnnouncementEntity } from '@vroom/database/announcement.entity';
import { GqlAuthGuard } from '../auth/jwt-gql-auth.guard';
import { AnnouncementDTO } from './dto/announcement.dto';
@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([AnnouncementEntity])],
      resolvers: [
        {
          EntityClass: AnnouncementEntity,
          DTOClass: AnnouncementDTO,
          read: { one: { disabled: true } },
          create: { disabled: true },
          update: { disabled: true },
          delete: { disabled: true },
          guards: [GqlAuthGuard],
        },
      ],
    }),
  ],
})
export class AnnouncementsModule {}
