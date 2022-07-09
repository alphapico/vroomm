import {
  DeepPartial,
  QueryService,
  UpdateOneOptions,
} from '@ptc-org/nestjs-query-core';
import { TypeOrmQueryService } from '@ptc-org/nestjs-query-typeorm';
import { Inject, Query } from '@nestjs/common';
import { CONTEXT } from '@nestjs/graphql';
import { InjectRepository } from '@nestjs/typeorm';
import { DriverEntity } from '@vroom/database/driver.entity';
import { DriverStatus } from '@vroom/database/enums/driver-status.enum';
import { ServiceEntity } from '@vroom/database/service.entity';
import { DriverRedisService } from '@vroom/redis/driver-redis.service';
import { Repository } from 'typeorm';
import { UserContext } from '../auth/authenticated-user';
import { UpdateDriverInput } from './dto/update-driver.input';

@QueryService(DriverEntity)
export class DriverQueryService extends TypeOrmQueryService<DriverEntity> {
  constructor(
    @InjectRepository(DriverEntity)
    private driverReposotriy: Repository<DriverEntity>,
    @InjectRepository(ServiceEntity)
    private serviceRepository: Repository<ServiceEntity>,
    private driverRedisService: DriverRedisService,
    @Inject(CONTEXT)
    private context: UserContext
  ) {
    super(driverReposotriy);
  }

  override async updateOne(
    id: string | number,
    update: UpdateDriverInput,
    opts?: UpdateOneOptions<DriverEntity>
  ): Promise<DriverEntity> {
    id = this.context.req.user.id;
    const allowedStatuses = [
      DriverStatus.Offline,
      DriverStatus.Online,
      DriverStatus.WaitingDocuments,
      DriverStatus.SoftReject,
    ];
    const isNotAllowed =
      allowedStatuses.filter(
        (status) => DriverStatus[status] == DriverStatus[update.status]
      ).length < 1;
    if (update.status && isNotAllowed) {
      delete update.status;
    }
    if (
      update.status == DriverStatus.PendingApproval &&
      process.env.DEMO_MODE != null
    ) {
      update.status = DriverStatus.Offline;
      this.serviceRepository
        .find()
        .then((services) =>
          this.driverReposotriy.save({
            id: id as number,
            enabledServices: services,
          })
        );
    }
    if (update.status == DriverStatus.Offline) {
      await this.driverRedisService.expire([id]);
    }
    return super.updateOne(id, update, opts);
  }
}
