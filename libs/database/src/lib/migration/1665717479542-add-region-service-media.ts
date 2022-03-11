import { MigrationInterface, QueryRunner } from "typeorm";

export class addRegionServiceMedia1665717479542 implements MigrationInterface {
    name = 'addRegionServiceMedia1665717479542'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE \`region\` (\`id\` int NOT NULL AUTO_INCREMENT, \`name\` varchar(255) NOT NULL, \`currency\` char(3) NOT NULL, \`enabled\` tinyint NOT NULL DEFAULT 1, \`location\` polygon NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`service_category\` (\`id\` int NOT NULL AUTO_INCREMENT, \`title\` varchar(255) NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`service_option\` (\`id\` int NOT NULL AUTO_INCREMENT, \`name\` varchar(255) NOT NULL, \`type\` enum ('Free', 'Paid', 'TwoWay') NOT NULL, \`additionalFee\` float(12,2) NULL, \`icon\` enum ('Pet', 'TwoWay', 'Luggage', 'PackageDelivery', 'Shopping', 'Custom1', 'Custom2', 'Custom3', 'Custom4', 'Custom5') NOT NULL, \`serviceId\` int NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`service\` (\`id\` int NOT NULL AUTO_INCREMENT, \`categoryId\` int NOT NULL, \`title\` varchar(255) NOT NULL, \`description\` varchar(255) NULL, \`personCapacity\` smallint NULL, \`baseFare\` float(12,2) NOT NULL DEFAULT '0.00', \`perHundredMeters\` float(12,2) NOT NULL DEFAULT '0.00', \`perMinuteDrive\` float(12,2) NOT NULL DEFAULT '0.00', \`perMinuteWait\` float(12,2) NOT NULL DEFAULT '0.00', \`minimumFee\` float(10,2) NOT NULL DEFAULT '0.00', \`searchRadius\` int NOT NULL DEFAULT '10000', \`paymentMethod\` enum ('CashCredit', 'OnlyCredit', 'OnlyCash') NOT NULL DEFAULT 'CashCredit', \`distanceFeeMode\` enum ('None', 'PickupToDestination', 'Radial') NOT NULL DEFAULT 'PickupToDestination', \`availableTimeFrom\` time NOT NULL DEFAULT '00:00', \`availableTimeTo\` time NOT NULL DEFAULT '23:59', \`maxDestinationDistance\` int NOT NULL DEFAULT '0', \`prepayPercent\` tinyint NOT NULL DEFAULT '0', \`twoWayAvailable\` tinyint NOT NULL DEFAULT 0, \`cancellationTotalFee\` float(10,2) NOT NULL DEFAULT '0.00', \`cancellationDriverShare\` float(10,2) NOT NULL DEFAULT '0.00', \`providerSharePercent\` tinyint NOT NULL DEFAULT '0', \`providerShareFlat\` float(10,2) NOT NULL DEFAULT '0.00', \`roundingFactor\` float(10,2) NULL, \`mediaId\` int NOT NULL, \`timeMultipliers\` text NULL, \`distanceMultipliers\` text NULL, \`touristMultiplier\` float NOT NULL DEFAULT '1', UNIQUE INDEX \`REL_8fc7040cc10d7b34cc749d18b6\` (\`mediaId\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`media\` (\`id\` int NOT NULL AUTO_INCREMENT, \`address\` varchar(255) NOT NULL, \`base64\` longtext NULL, \`driverDocumentId\` int NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`service_regions_region\` (\`serviceId\` int NOT NULL, \`regionId\` int NOT NULL, INDEX \`IDX_57731efa92f6ce3495042b80a4\` (\`serviceId\`), INDEX \`IDX_58ba035359e1a0548e6b4af5e3\` (\`regionId\`), PRIMARY KEY (\`serviceId\`, \`regionId\`)) ENGINE=InnoDB`);
        await queryRunner.query(`ALTER TABLE \`operator\` ADD \`mediaId\` int NULL`);
        await queryRunner.query(`ALTER TABLE \`operator\` ADD UNIQUE INDEX \`IDX_092affee7993ba757fad472be1\` (\`mediaId\`)`);
        await queryRunner.query(`CREATE UNIQUE INDEX \`REL_092affee7993ba757fad472be1\` ON \`operator\` (\`mediaId\`)`);
        await queryRunner.query(`ALTER TABLE \`operator\` ADD CONSTRAINT \`FK_092affee7993ba757fad472be1c\` FOREIGN KEY (\`mediaId\`) REFERENCES \`media\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`service_option\` ADD CONSTRAINT \`FK_3fafcf26db28892a4082c49ddfb\` FOREIGN KEY (\`serviceId\`) REFERENCES \`service\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`service\` ADD CONSTRAINT \`FK_cb169715cbb8c74f263ba192ca8\` FOREIGN KEY (\`categoryId\`) REFERENCES \`service_category\`(\`id\`) ON DELETE CASCADE ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`service\` ADD CONSTRAINT \`FK_8fc7040cc10d7b34cc749d18b60\` FOREIGN KEY (\`mediaId\`) REFERENCES \`media\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`service_regions_region\` ADD CONSTRAINT \`FK_57731efa92f6ce3495042b80a4f\` FOREIGN KEY (\`serviceId\`) REFERENCES \`service\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`);
        await queryRunner.query(`ALTER TABLE \`service_regions_region\` ADD CONSTRAINT \`FK_58ba035359e1a0548e6b4af5e39\` FOREIGN KEY (\`regionId\`) REFERENCES \`region\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`service_regions_region\` DROP FOREIGN KEY \`FK_58ba035359e1a0548e6b4af5e39\``);
        await queryRunner.query(`ALTER TABLE \`service_regions_region\` DROP FOREIGN KEY \`FK_57731efa92f6ce3495042b80a4f\``);
        await queryRunner.query(`ALTER TABLE \`service\` DROP FOREIGN KEY \`FK_8fc7040cc10d7b34cc749d18b60\``);
        await queryRunner.query(`ALTER TABLE \`service\` DROP FOREIGN KEY \`FK_cb169715cbb8c74f263ba192ca8\``);
        await queryRunner.query(`ALTER TABLE \`service_option\` DROP FOREIGN KEY \`FK_3fafcf26db28892a4082c49ddfb\``);
        await queryRunner.query(`ALTER TABLE \`operator\` DROP FOREIGN KEY \`FK_092affee7993ba757fad472be1c\``);
        await queryRunner.query(`DROP INDEX \`REL_092affee7993ba757fad472be1\` ON \`operator\``);
        await queryRunner.query(`ALTER TABLE \`operator\` DROP INDEX \`IDX_092affee7993ba757fad472be1\``);
        await queryRunner.query(`ALTER TABLE \`operator\` DROP COLUMN \`mediaId\``);
        await queryRunner.query(`DROP INDEX \`IDX_58ba035359e1a0548e6b4af5e3\` ON \`service_regions_region\``);
        await queryRunner.query(`DROP INDEX \`IDX_57731efa92f6ce3495042b80a4\` ON \`service_regions_region\``);
        await queryRunner.query(`DROP TABLE \`service_regions_region\``);
        await queryRunner.query(`DROP TABLE \`media\``);
        await queryRunner.query(`DROP INDEX \`REL_8fc7040cc10d7b34cc749d18b6\` ON \`service\``);
        await queryRunner.query(`DROP TABLE \`service\``);
        await queryRunner.query(`DROP TABLE \`service_option\``);
        await queryRunner.query(`DROP TABLE \`service_category\``);
        await queryRunner.query(`DROP TABLE \`region\``);
    }

}
