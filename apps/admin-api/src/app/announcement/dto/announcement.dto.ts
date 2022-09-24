import { Authorize, IDField } from '@ptc-org/nestjs-query-graphql';
import { Field, ID, ObjectType } from '@nestjs/graphql';
import { AnnouncementAuthorizer } from './announcement.authorizer';

@ObjectType('Announcement')
@Authorize(AnnouncementAuthorizer)
export class AnnouncementDTO {
  @IDField(() => ID)
  id!: number;
  @Field()
  title: string;
  @Field()
  description: string;
  @Field({ nullable: true })
  url?: string;
  @Field()
  startAt: Date;
  @Field()
  expireAt: Date;
}
