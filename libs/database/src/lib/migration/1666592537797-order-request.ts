import { MigrationInterface, QueryRunner } from 'typeorm';

export class orderRequest1666592537797 implements MigrationInterface {
  name = 'orderRequest1666592537797';

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `CREATE TABLE \`order_chat\` (\`id\` int NOT NULL AUTO_INCREMENT, \`sentAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`sentByDriver\` tinyint NOT NULL, \`state\` enum ('sent', 'delivered', 'seen') NOT NULL DEFAULT 'sent', \`content\` varchar(255) NOT NULL, \`orderId\` int NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`
    );
    await queryRunner.query(
      `CREATE TABLE \`order_activity\` (\`id\` int NOT NULL AUTO_INCREMENT, \`type\` enum ('RequestedByOperator', 'BookedByOperator', 'RequestedByRider', 'BookedByRider', 'DriverAccepted', 'ArrivedToPickupPoint', 'CanceledByDriver', 'CanceledByRider', 'CanceledByOperator', 'Started', 'ArrivedToDestination', 'Paid', 'Reviewed', 'Expired') NOT NULL, \`createdAt\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`orderId\` int NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`
    );
    await queryRunner.query(
      `CREATE TABLE \`order\` (\`id\` int NOT NULL AUTO_INCREMENT, \`orderTimestamp\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`startTimestamp\` datetime NULL, \`finishTimestamp\` datetime NULL, \`status\` enum ('Requested', 'NotFound', 'NoCloseFound', 'Found', 'DriverAccepted', 'Arrived', 'WaitingForPrePay', 'DriverCanceled', 'RiderCanceled', 'Started', 'WaitingForPostPay', 'WaitingForReview', 'Finished', 'Booked', 'Expired') NOT NULL DEFAULT 'Requested', \`distanceBest\` int NOT NULL DEFAULT '0', \`durationBest\` int NOT NULL DEFAULT '0', \`waitMinutes\` int NOT NULL DEFAULT '0', \`expectedTimestamp\` datetime NOT NULL, \`etaPickup\` datetime NULL, \`costBest\` float(10,2) NOT NULL, \`costAfterCoupon\` float(10,2) NOT NULL DEFAULT '0.00', \`tipAmount\` float(10,2) NOT NULL DEFAULT '0.00', \`paidAmount\` float(10,2) NOT NULL DEFAULT '0.00', \`providerShare\` float(10,2) NOT NULL DEFAULT '0.00', \`addresses\` varchar(500) NOT NULL, \`points\` multipoint NOT NULL, \`directions\` multipoint NULL, \`driverId\` int NULL, \`passengerId\` int NOT NULL, \`currency\` char(3) NOT NULL, \`paymentGatewayId\` int NULL, \`serviceId\` int NOT NULL, \`operatorId\` int NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`
    );
    await queryRunner.query(
      `CREATE TABLE \`order_options_service_option\` (\`orderId\` int NOT NULL, \`serviceOptionId\` int NOT NULL, INDEX \`IDX_6c6d03318cfd3d4a0067ccfb3d\` (\`orderId\`), INDEX \`IDX_a61748aaca35d53600ffcc97c1\` (\`serviceOptionId\`), PRIMARY KEY (\`orderId\`, \`serviceOptionId\`)) ENGINE=InnoDB`
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger_transaction\` ADD \`orderId\` int NULL`
    );
    await queryRunner.query(
      `ALTER TABLE \`driver_transaction\` ADD \`orderId\` int NULL`
    );
    await queryRunner.query(
      `ALTER TABLE \`order_chat\` ADD CONSTRAINT \`FK_3cb1bb67ce6c931ac34596ddb85\` FOREIGN KEY (\`orderId\`) REFERENCES \`order\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
    await queryRunner.query(
      `ALTER TABLE \`order_activity\` ADD CONSTRAINT \`FK_e94d055dcc355609a9ae29414f2\` FOREIGN KEY (\`orderId\`) REFERENCES \`order\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
    await queryRunner.query(
      `ALTER TABLE \`order\` ADD CONSTRAINT \`FK_8cbf856839ddca842f21b804a91\` FOREIGN KEY (\`driverId\`) REFERENCES \`driver\`(\`id\`) ON DELETE SET NULL ON UPDATE CASCADE`
    );
    await queryRunner.query(
      `ALTER TABLE \`order\` ADD CONSTRAINT \`FK_32984dd5fdb7cb9d85ca6a7e8b1\` FOREIGN KEY (\`passengerId\`) REFERENCES \`passenger\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
    await queryRunner.query(
      `ALTER TABLE \`order\` ADD CONSTRAINT \`FK_e00d6650118a639244282775cf4\` FOREIGN KEY (\`paymentGatewayId\`) REFERENCES \`payment_gateway\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
    await queryRunner.query(
      `ALTER TABLE \`order\` ADD CONSTRAINT \`FK_c721e93645fdc15f040096d1eaa\` FOREIGN KEY (\`serviceId\`) REFERENCES \`service\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
    await queryRunner.query(
      `ALTER TABLE \`order\` ADD CONSTRAINT \`FK_d5c8d978ec46ceb605624469151\` FOREIGN KEY (\`operatorId\`) REFERENCES \`operator\`(\`id\`) ON DELETE RESTRICT ON UPDATE RESTRICT`
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger_transaction\` ADD CONSTRAINT \`FK_ce0fa5ad508319bf89433dff17b\` FOREIGN KEY (\`orderId\`) REFERENCES \`order\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
    await queryRunner.query(
      `ALTER TABLE \`driver_transaction\` ADD CONSTRAINT \`FK_6326905030bcf8222843481ff75\` FOREIGN KEY (\`orderId\`) REFERENCES \`order\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
    await queryRunner.query(
      `ALTER TABLE \`order_options_service_option\` ADD CONSTRAINT \`FK_6c6d03318cfd3d4a0067ccfb3d0\` FOREIGN KEY (\`orderId\`) REFERENCES \`order\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`
    );
    await queryRunner.query(
      `ALTER TABLE \`order_options_service_option\` ADD CONSTRAINT \`FK_a61748aaca35d53600ffcc97c18\` FOREIGN KEY (\`serviceOptionId\`) REFERENCES \`service_option\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `ALTER TABLE \`order_options_service_option\` DROP FOREIGN KEY \`FK_a61748aaca35d53600ffcc97c18\``
    );
    await queryRunner.query(
      `ALTER TABLE \`order_options_service_option\` DROP FOREIGN KEY \`FK_6c6d03318cfd3d4a0067ccfb3d0\``
    );
    await queryRunner.query(
      `ALTER TABLE \`driver_transaction\` DROP FOREIGN KEY \`FK_6326905030bcf8222843481ff75\``
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger_transaction\` DROP FOREIGN KEY \`FK_ce0fa5ad508319bf89433dff17b\``
    );
    await queryRunner.query(
      `ALTER TABLE \`order\` DROP FOREIGN KEY \`FK_d5c8d978ec46ceb605624469151\``
    );
    await queryRunner.query(
      `ALTER TABLE \`order\` DROP FOREIGN KEY \`FK_c721e93645fdc15f040096d1eaa\``
    );
    await queryRunner.query(
      `ALTER TABLE \`order\` DROP FOREIGN KEY \`FK_e00d6650118a639244282775cf4\``
    );
    await queryRunner.query(
      `ALTER TABLE \`order\` DROP FOREIGN KEY \`FK_32984dd5fdb7cb9d85ca6a7e8b1\``
    );
    await queryRunner.query(
      `ALTER TABLE \`order\` DROP FOREIGN KEY \`FK_8cbf856839ddca842f21b804a91\``
    );
    await queryRunner.query(
      `ALTER TABLE \`order_activity\` DROP FOREIGN KEY \`FK_e94d055dcc355609a9ae29414f2\``
    );
    await queryRunner.query(
      `ALTER TABLE \`order_chat\` DROP FOREIGN KEY \`FK_3cb1bb67ce6c931ac34596ddb85\``
    );
    await queryRunner.query(
      `ALTER TABLE \`driver_transaction\` DROP COLUMN \`orderId\``
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger_transaction\` DROP COLUMN \`orderId\``
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_a61748aaca35d53600ffcc97c1\` ON \`order_options_service_option\``
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_6c6d03318cfd3d4a0067ccfb3d\` ON \`order_options_service_option\``
    );
    await queryRunner.query(`DROP TABLE \`order_options_service_option\``);
    await queryRunner.query(`DROP TABLE \`order\``);
    await queryRunner.query(`DROP TABLE \`order_activity\``);
    await queryRunner.query(`DROP TABLE \`order_chat\``);
  }
}
