import { IDField } from '@ptc-org/nestjs-query-graphql';
import { ID, ObjectType } from '@nestjs/graphql';

@ObjectType('Announcement')
export class AnnouncementDTO {
  @IDField(() => ID)
  id: number;
  startAt: Date;
  expireAt: Date;
  title: string;
  description: string;
  url?: string;
}
