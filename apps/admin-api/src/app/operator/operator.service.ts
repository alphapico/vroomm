import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { OperatorEntity } from '@vroom/database/operator.entity';
import { Repository } from 'typeorm';

@Injectable()
export class OperatorService {
  constructor(
    @InjectRepository(OperatorEntity)
    public repo: Repository<OperatorEntity>
  ) {}

  async validateCredentials(
    userName: string,
    password: string
  ): Promise<OperatorEntity | null> {
    return this.repo.findOne({
      relations: {
        role: true,
      },
      where: { userName, password },
    });
    // return this.repo.findOneBy({ userName, password });
  }

  async getById(id: number): Promise<OperatorEntity | null> {
    return this.repo.findOneBy({ id });
  }

  async getAuthorization(id: number) {
    return await this.repo.findOne({
      relations: { role: true },
      where: { id: id },
    });
  }
}
