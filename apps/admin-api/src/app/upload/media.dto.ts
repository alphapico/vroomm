import { IDField } from '@ptc-org/nestjs-query-graphql';
import { Field, ID, ObjectType } from '@nestjs/graphql';

@ObjectType('Media')
export class MediaDTO {
  @IDField(() => ID)
  id: number;

  @Field()
  address: string;

  @Field()
  base64?: string;
}
