import { IDField } from '@ptc-org/nestjs-query-graphql';
import { Field, ID, ObjectType } from '@nestjs/graphql';

@ObjectType('Announcement')
export class AnnouncementDTO {
  @IDField(() => ID)
  id: number;
  @Field()
  startAt: Date;
  @Field()
  expireAt: Date;
  @Field()
  title: string;
  @Field()
  description: string;
  @Field({ nullable: true })
  url?: string;
}
