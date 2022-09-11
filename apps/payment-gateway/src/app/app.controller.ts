import { Controller, Get, Req, Res } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { FastifyReply, FastifyRequest } from 'fastify';
import { Repository } from 'typeorm';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  async defaultPath(@Res() res: FastifyReply) {
    res.send(`✅ Payment Gateways microservice running`);
  }
}
