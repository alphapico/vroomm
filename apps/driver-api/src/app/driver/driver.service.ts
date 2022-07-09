import { Injectable, Logger } from '@nestjs/common';
import { DriverEntity } from '@vroom/database/driver.entity';
import { In, Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { DriverStatus } from '@vroom/database/enums/driver-status.enum';
import { DriverRedisService } from '@vroom/redis/driver-redis.service';

@Injectable()
export class DriverService {
  constructor(
    @InjectRepository(DriverEntity) private repo: Repository<DriverEntity>,
    private driverRedisService: DriverRedisService
  ) {}

  async findById(id: number): Promise<DriverEntity> {
    return this.repo.findOne({ where: { id }, withDeleted: true });
  }

  private async findUserByMobileNumber(
    mobileNumber: string
  ): Promise<DriverEntity> {
    return this.repo.findOne({ where: { mobileNumber }, withDeleted: true });
  }

  async findOrCreateUserWithMobileNumber(
    mobileNumber: string
  ): Promise<DriverEntity> {
    const findResult = await this.findUserByMobileNumber(mobileNumber);
    if (findResult?.deletedAt != null) {
      await this.repo.restore(findResult.id);
    }
    return (
      findResult ??
      this.repo.save({
        mobileNumber: mobileNumber,
      })
    );
  }

  async findByIds(ids: number[]): Promise<DriverEntity[]> {
    return this.repo.find({ where: { id: In(ids) }, withDeleted: true });
  }

  async expireDriverStatus(driverIds: number[]) {
    if (driverIds.length < 1) {
      return;
    }
    this.driverRedisService.expire(driverIds);
    return this.repo.update(driverIds, {
      status: DriverStatus.Offline,
      lastSeenTimestamp: new Date(),
    });
  }

  async deleteById(id: number): Promise<DriverEntity> {
    const user = await this.findById(id);
    await this.repo.softDelete(id);
    return user;
  }
}
