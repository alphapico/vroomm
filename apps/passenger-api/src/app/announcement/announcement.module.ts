import { NestjsQueryGraphQLModule } from '@ptc-org/nestjs-query-graphql';
import { NestjsQueryTypeOrmModule } from '@ptc-org/nestjs-query-typeorm';
import { Module } from '@nestjs/common';
import { AnnouncementEntity } from '@vroom/database/announcement.entity';

import { AnnouncementDTO } from './dto/announcement.dto';

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [NestjsQueryTypeOrmModule.forFeature([AnnouncementEntity])],
      resolvers: [
        {
          EntityClass: AnnouncementEntity,
          DTOClass: AnnouncementDTO,
          create: { disabled: true },
          delete: { disabled: true },
          update: { disabled: true },
        },
      ],
    }),
  ],
})
export class AnnouncementModule {}
