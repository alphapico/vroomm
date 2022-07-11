import { NestjsQueryGraphQLModule } from '@ptc-org/nestjs-query-graphql';
import { NestjsQueryTypeOrmModule } from '@ptc-org/nestjs-query-typeorm';
import { Module } from '@nestjs/common';
import { DriverEntity } from '@vroom/database/driver.entity';
import { MediaEntity } from '@vroom/database/media.entity';
import { MediaDTO } from './media.dto';
import { UploadService } from './upload.service';

@Module({
  imports: [
    NestjsQueryGraphQLModule.forFeature({
      imports: [
        NestjsQueryTypeOrmModule.forFeature([MediaEntity, DriverEntity]),
      ],
      resolvers: [
        {
          EntityClass: MediaEntity,
          DTOClass: MediaDTO,
          create: { disabled: true },
          read: { disabled: true },
          delete: { disabled: true },
          update: { disabled: true },
        },
      ],
    }),
  ],
  providers: [UploadService],
  exports: [UploadService, NestjsQueryGraphQLModule],
})
export class UploadModule {}
