import {
  Authorize,
  FilterableField,
  IDField,
  PagingStrategies,
  QueryOptions,
} from '@ptc-org/nestjs-query-graphql';
import { Field, ID, ObjectType } from '@nestjs/graphql';
import { AnnouncementUserType } from '@vroom/database/enums/anouncement-user-type.enum';

@ObjectType('Announcement')
@QueryOptions({
  pagingStrategy: PagingStrategies.NONE,
})
@Authorize({
  authorize: () => ({
    userType: { in: [[AnnouncementUserType.Driver]] },
    startAt: { gt: new Date() },
    expireAt: { lt: new Date() },
  }),
})
export class AnnouncementDTO {
  @IDField(() => ID)
  id: number;
  @Field()
  title: string;
  @Field()
  description: string;
  @Field()
  startAt: Date;
  @Field()
  expireAt: Date;
  @Field({ nullable: true })
  url?: string;
  @FilterableField(() => AnnouncementUserType)
  userType: AnnouncementUserType[];
}
