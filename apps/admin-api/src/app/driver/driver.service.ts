import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { DriverEntity } from '@vroom/database/driver.entity';
import { Repository } from 'typeorm';

@Injectable()
export class DriverService {
  constructor(
    @InjectRepository(DriverEntity)
    private driverRepository: Repository<DriverEntity>
  ) {}
}
