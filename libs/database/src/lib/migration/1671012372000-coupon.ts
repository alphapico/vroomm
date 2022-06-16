import { MigrationInterface, QueryRunner } from 'typeorm';

export class coupon1671012372000 implements MigrationInterface {
  name = 'coupon1671012372000';

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `CREATE TABLE \`coupon\` (\`id\` int NOT NULL AUTO_INCREMENT, \`code\` varchar(255) NOT NULL, \`title\` varchar(255) NOT NULL, \`description\` varchar(255) NULL, \`manyUsersCanUse\` int NOT NULL DEFAULT '0', \`manyTimesUserCanUse\` int NOT NULL DEFAULT '1', \`minimumCost\` float(10,2) NOT NULL DEFAULT '0.00', \`maximumCost\` float(10,2) NOT NULL DEFAULT '0.00', \`startTimestamp\` datetime NOT NULL, \`expirationTimestamp\` datetime NULL, \`discountPercent\` tinyint NOT NULL DEFAULT '0', \`discountFlat\` float(10,2) NOT NULL DEFAULT '0.00', \`creditGift\` float(10,2) NOT NULL DEFAULT '0.00', \`isEnabled\` tinyint NOT NULL DEFAULT 1, \`isFirstTravelOnly\` tinyint NOT NULL DEFAULT 0, UNIQUE INDEX \`IDX_62d3c5b0ce63a82c48e86d904b\` (\`code\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`
    );
    await queryRunner.query(
      `CREATE TABLE \`passenger_coupons_coupon\` (\`passengerId\` int NOT NULL, \`couponId\` int NOT NULL, INDEX \`IDX_eae9cbd4dbf1b262de4b97e337\` (\`passengerId\`), INDEX \`IDX_49ca825a52e9cd58acad853fa0\` (\`couponId\`), PRIMARY KEY (\`passengerId\`, \`couponId\`)) ENGINE=InnoDB`
    );
    await queryRunner.query(
      `CREATE TABLE \`coupon_services_service\` (\`couponId\` int NOT NULL, \`serviceId\` int NOT NULL, INDEX \`IDX_32610819efa346d401fbeb7403\` (\`couponId\`), INDEX \`IDX_050c71256e20c925e1ff151b17\` (\`serviceId\`), PRIMARY KEY (\`couponId\`, \`serviceId\`)) ENGINE=InnoDB`
    );
    await queryRunner.query(`ALTER TABLE \`order\` ADD \`couponId\` int NULL`);
    await queryRunner.query(
      `ALTER TABLE \`order\` ADD CONSTRAINT \`FK_8e2b018ed0091fa11714dd7b3e1\` FOREIGN KEY (\`couponId\`) REFERENCES \`coupon\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger_coupons_coupon\` ADD CONSTRAINT \`FK_eae9cbd4dbf1b262de4b97e3377\` FOREIGN KEY (\`passengerId\`) REFERENCES \`passenger\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger_coupons_coupon\` ADD CONSTRAINT \`FK_49ca825a52e9cd58acad853fa00\` FOREIGN KEY (\`couponId\`) REFERENCES \`coupon\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
    await queryRunner.query(
      `ALTER TABLE \`coupon_services_service\` ADD CONSTRAINT \`FK_32610819efa346d401fbeb74031\` FOREIGN KEY (\`couponId\`) REFERENCES \`coupon\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`
    );
    await queryRunner.query(
      `ALTER TABLE \`coupon_services_service\` ADD CONSTRAINT \`FK_050c71256e20c925e1ff151b175\` FOREIGN KEY (\`serviceId\`) REFERENCES \`service\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `ALTER TABLE \`coupon_services_service\` DROP FOREIGN KEY \`FK_050c71256e20c925e1ff151b175\``
    );
    await queryRunner.query(
      `ALTER TABLE \`coupon_services_service\` DROP FOREIGN KEY \`FK_32610819efa346d401fbeb74031\``
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger_coupons_coupon\` DROP FOREIGN KEY \`FK_49ca825a52e9cd58acad853fa00\``
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger_coupons_coupon\` DROP FOREIGN KEY \`FK_eae9cbd4dbf1b262de4b97e3377\``
    );
    await queryRunner.query(
      `ALTER TABLE \`order\` DROP FOREIGN KEY \`FK_8e2b018ed0091fa11714dd7b3e1\``
    );
    await queryRunner.query(`ALTER TABLE \`order\` DROP COLUMN \`couponId\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_050c71256e20c925e1ff151b17\` ON \`coupon_services_service\``
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_32610819efa346d401fbeb7403\` ON \`coupon_services_service\``
    );
    await queryRunner.query(`DROP TABLE \`coupon_services_service\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_49ca825a52e9cd58acad853fa0\` ON \`passenger_coupons_coupon\``
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_eae9cbd4dbf1b262de4b97e337\` ON \`passenger_coupons_coupon\``
    );
    await queryRunner.query(`DROP TABLE \`passenger_coupons_coupon\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_62d3c5b0ce63a82c48e86d904b\` ON \`coupon\``
    );
    await queryRunner.query(`DROP TABLE \`coupon\``);
  }
}
