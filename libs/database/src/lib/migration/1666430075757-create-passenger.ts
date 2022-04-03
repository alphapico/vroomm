import { MigrationInterface, QueryRunner } from 'typeorm';

export class createPassenger1666430075757 implements MigrationInterface {
  name = 'createPassenger1666430075757';

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `CREATE TABLE \`passenger_address\` (\`id\` int NOT NULL AUTO_INCREMENT, \`type\` enum ('Home', 'Work', 'Partner', 'Gym', 'Parent', 'Cafe', 'Park', 'Other') NOT NULL DEFAULT 'Other', \`title\` varchar(255) NOT NULL, \`address\` varchar(255) NULL, \`location\` point NOT NULL, \`passengerId\` int NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`
    );
    await queryRunner.query(
      `CREATE TABLE \`passenger_transaction\` (\`id\` int NOT NULL AUTO_INCREMENT, \`transactionTime\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`status\` enum ('Processing', 'Done', 'Canceled', 'Rejected') NOT NULL DEFAULT 'Processing', \`action\` enum ('Recharge', 'Deduct') NOT NULL, \`deductType\` enum ('OrderFee', 'Withdraw', 'Correction') NULL, \`rechargeType\` enum ('BankTransfer', 'Gift', 'Correction', 'InAppPayment') NULL, \`amount\` float(10,2) NOT NULL DEFAULT '0.00', \`currency\` char(3) NOT NULL, \`documentNumber\` varchar(255) NULL, \`details\` varchar(255) NULL, \`passengerId\` int NOT NULL, \`operatorId\` int NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`
    );
    await queryRunner.query(
      `CREATE TABLE \`passenger_wallet\` (\`id\` int NOT NULL AUTO_INCREMENT, \`amount\` float NOT NULL DEFAULT '0', \`currency\` char(3) NOT NULL, \`passengerId\` int NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`
    );
    await queryRunner.query(
      `CREATE TABLE \`passenger\` (\`id\` int NOT NULL AUTO_INCREMENT, \`status\` enum ('enabled', 'blocked') NOT NULL DEFAULT 'enabled', \`firstName\` varchar(255) NULL, \`lastName\` varchar(255) NULL, \`mobileNumber\` bigint NOT NULL, \`registrationTimestamp\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`email\` varchar(255) NULL, \`gender\` enum ('male', 'female', 'unknown') NULL, \`address\` varchar(255) NULL, \`isResident\` tinyint NULL, \`idNumber\` varchar(255) NULL, \`documentType\` enum ('ID', 'Passport', 'DriverLicense', 'ResidentPermitID') NULL, \`notificationPlayerId\` varchar(255) NULL, \`deletedAt\` datetime(6) NULL, \`mediaId\` int NULL, UNIQUE INDEX \`IDX_21ac79465c14973c91b7c464b4\` (\`mobileNumber\`), UNIQUE INDEX \`REL_cd97423a9ed074b713424d99c5\` (\`mediaId\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger_address\` ADD CONSTRAINT \`FK_432cc0c1c5784b594bdcac9d060\` FOREIGN KEY (\`passengerId\`) REFERENCES \`passenger\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger_transaction\` ADD CONSTRAINT \`FK_befcc273a015ec4734966b1d117\` FOREIGN KEY (\`passengerId\`) REFERENCES \`passenger\`(\`id\`) ON DELETE CASCADE ON UPDATE RESTRICT`
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger_transaction\` ADD CONSTRAINT \`FK_9ccd613a9d1e472932dc416c02d\` FOREIGN KEY (\`operatorId\`) REFERENCES \`operator\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger_wallet\` ADD CONSTRAINT \`FK_c56a3514588d57ec66df077b5e8\` FOREIGN KEY (\`passengerId\`) REFERENCES \`passenger\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger\` ADD CONSTRAINT \`FK_cd97423a9ed074b713424d99c5a\` FOREIGN KEY (\`mediaId\`) REFERENCES \`media\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `ALTER TABLE \`passenger\` DROP FOREIGN KEY \`FK_cd97423a9ed074b713424d99c5a\``
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger_wallet\` DROP FOREIGN KEY \`FK_c56a3514588d57ec66df077b5e8\``
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger_transaction\` DROP FOREIGN KEY \`FK_9ccd613a9d1e472932dc416c02d\``
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger_transaction\` DROP FOREIGN KEY \`FK_befcc273a015ec4734966b1d117\``
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger_address\` DROP FOREIGN KEY \`FK_432cc0c1c5784b594bdcac9d060\``
    );
    await queryRunner.query(
      `DROP INDEX \`REL_cd97423a9ed074b713424d99c5\` ON \`passenger\``
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_21ac79465c14973c91b7c464b4\` ON \`passenger\``
    );
    await queryRunner.query(`DROP TABLE \`passenger\``);
    await queryRunner.query(`DROP TABLE \`passenger_wallet\``);
    await queryRunner.query(`DROP TABLE \`passenger_transaction\``);
    await queryRunner.query(`DROP TABLE \`passenger_address\``);
  }
}
