import { MigrationInterface, QueryRunner } from "typeorm";

export class createDriverAndCar1666189416880 implements MigrationInterface {
    name = 'createDriverAndCar1666189416880'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`DROP INDEX \`IDX_092affee7993ba757fad472be1\` ON \`operator\``);
        await queryRunner.query(`CREATE TABLE \`car\` (\`id\` int NOT NULL AUTO_INCREMENT, \`title\` varchar(255) NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`driver_transaction\` (\`id\` int NOT NULL AUTO_INCREMENT, \`transactionTime\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`status\` enum ('Processing', 'Done', 'Canceled', 'Rejected') NOT NULL DEFAULT 'Processing', \`action\` enum ('Recharge', 'Deduct') NOT NULL, \`deductType\` enum ('Withdraw', 'Commission', 'Correction') NULL, \`rechargeType\` enum ('OrderFee', 'BankTransfer', 'InAppPayment', 'Gift') NULL, \`amount\` float(10,2) NOT NULL DEFAULT '0.00', \`currency\` char(3) NOT NULL, \`documentNumber\` varchar(255) NULL, \`details\` varchar(255) NULL, \`driverId\` int NOT NULL, \`operatorId\` int NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`driver_wallet\` (\`id\` int NOT NULL AUTO_INCREMENT, \`amount\` float NOT NULL DEFAULT '0', \`currency\` char(3) NOT NULL, \`driverId\` int NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`driver\` (\`id\` int NOT NULL AUTO_INCREMENT, \`firstName\` varchar(255) NULL, \`lastName\` varchar(255) NULL, \`mobileNumber\` bigint NOT NULL, \`certificateNumber\` varchar(255) NULL, \`email\` varchar(255) NULL, \`carId\` int NULL, \`carColor\` varchar(255) NULL, \`carColorId\` int NULL, \`carProductionYear\` int NULL, \`carPlate\` varchar(255) NULL, \`searchDistance\` int NULL, \`status\` enum ('online', 'offline', 'blocked', 'in service', 'waiting documents', 'pending approval', 'soft reject', 'hard reject') NOT NULL DEFAULT 'waiting documents', \`gender\` enum ('male', 'female', 'unknown') NULL, \`registrationTimestamp\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`rating\` tinyint NULL, \`reviewCount\` smallint NOT NULL DEFAULT '0', \`lastSeenTimestamp\` datetime NULL, \`accountNumber\` varchar(255) NULL, \`bankName\` varchar(255) NULL, \`bankRoutingNumber\` varchar(255) NULL, \`bankSwift\` varchar(255) NULL, \`address\` varchar(255) NULL, \`notificationPlayerId\` varchar(255) NULL, \`documentsNote\` varchar(255) NULL, \`deletedAt\` datetime(6) NULL, \`mediaId\` int NULL, UNIQUE INDEX \`IDX_e6297db8efeb6cbdb2281e4d89\` (\`mobileNumber\`), UNIQUE INDEX \`REL_f3cbfdc82019ea5fda5b5adfb8\` (\`mediaId\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`car_color\` (\`id\` int NOT NULL AUTO_INCREMENT, \`name\` varchar(255) NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`driver_services_service\` (\`driverId\` int NOT NULL, \`serviceId\` int NOT NULL, INDEX \`IDX_8ba3c0a700b7afc12ec813f7ae\` (\`driverId\`), INDEX \`IDX_1f4089e0b2df52144cec0282a5\` (\`serviceId\`), PRIMARY KEY (\`driverId\`, \`serviceId\`)) ENGINE=InnoDB`);
        await queryRunner.query(`ALTER TABLE \`service\` CHANGE \`availableTimeFrom\` \`availableTimeFrom\` time NOT NULL DEFAULT '00:00'`);
        await queryRunner.query(`ALTER TABLE \`service\` CHANGE \`availableTimeTo\` \`availableTimeTo\` time NOT NULL DEFAULT '23:59'`);
        await queryRunner.query(`ALTER TABLE \`media\` ADD CONSTRAINT \`FK_3fb4de1fa67d1f815a2215c8309\` FOREIGN KEY (\`driverDocumentId\`) REFERENCES \`driver\`(\`id\`) ON DELETE SET NULL ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`driver_transaction\` ADD CONSTRAINT \`FK_7b433bf733afdea636322f99920\` FOREIGN KEY (\`driverId\`) REFERENCES \`driver\`(\`id\`) ON DELETE CASCADE ON UPDATE RESTRICT`);
        await queryRunner.query(`ALTER TABLE \`driver_transaction\` ADD CONSTRAINT \`FK_f1a21153d95f19eb1e17a193fdd\` FOREIGN KEY (\`operatorId\`) REFERENCES \`operator\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`driver_wallet\` ADD CONSTRAINT \`FK_6e56cf769a5bf5cf38ed1641854\` FOREIGN KEY (\`driverId\`) REFERENCES \`driver\`(\`id\`) ON DELETE CASCADE ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`driver\` ADD CONSTRAINT \`FK_7174f800666245cdf8454882d3b\` FOREIGN KEY (\`carId\`) REFERENCES \`car\`(\`id\`) ON DELETE SET NULL ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`driver\` ADD CONSTRAINT \`FK_9b6383172071e15432eed3c480b\` FOREIGN KEY (\`carColorId\`) REFERENCES \`car_color\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`driver\` ADD CONSTRAINT \`FK_f3cbfdc82019ea5fda5b5adfb88\` FOREIGN KEY (\`mediaId\`) REFERENCES \`media\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`driver_services_service\` ADD CONSTRAINT \`FK_8ba3c0a700b7afc12ec813f7ae0\` FOREIGN KEY (\`driverId\`) REFERENCES \`driver\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`);
        await queryRunner.query(`ALTER TABLE \`driver_services_service\` ADD CONSTRAINT \`FK_1f4089e0b2df52144cec0282a5c\` FOREIGN KEY (\`serviceId\`) REFERENCES \`service\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`driver_services_service\` DROP FOREIGN KEY \`FK_1f4089e0b2df52144cec0282a5c\``);
        await queryRunner.query(`ALTER TABLE \`driver_services_service\` DROP FOREIGN KEY \`FK_8ba3c0a700b7afc12ec813f7ae0\``);
        await queryRunner.query(`ALTER TABLE \`driver\` DROP FOREIGN KEY \`FK_f3cbfdc82019ea5fda5b5adfb88\``);
        await queryRunner.query(`ALTER TABLE \`driver\` DROP FOREIGN KEY \`FK_9b6383172071e15432eed3c480b\``);
        await queryRunner.query(`ALTER TABLE \`driver\` DROP FOREIGN KEY \`FK_7174f800666245cdf8454882d3b\``);
        await queryRunner.query(`ALTER TABLE \`driver_wallet\` DROP FOREIGN KEY \`FK_6e56cf769a5bf5cf38ed1641854\``);
        await queryRunner.query(`ALTER TABLE \`driver_transaction\` DROP FOREIGN KEY \`FK_f1a21153d95f19eb1e17a193fdd\``);
        await queryRunner.query(`ALTER TABLE \`driver_transaction\` DROP FOREIGN KEY \`FK_7b433bf733afdea636322f99920\``);
        await queryRunner.query(`ALTER TABLE \`media\` DROP FOREIGN KEY \`FK_3fb4de1fa67d1f815a2215c8309\``);
        await queryRunner.query(`ALTER TABLE \`service\` CHANGE \`availableTimeTo\` \`availableTimeTo\` time NOT NULL DEFAULT '23:59:00'`);
        await queryRunner.query(`ALTER TABLE \`service\` CHANGE \`availableTimeFrom\` \`availableTimeFrom\` time NOT NULL DEFAULT '00:00:00'`);
        await queryRunner.query(`DROP INDEX \`IDX_1f4089e0b2df52144cec0282a5\` ON \`driver_services_service\``);
        await queryRunner.query(`DROP INDEX \`IDX_8ba3c0a700b7afc12ec813f7ae\` ON \`driver_services_service\``);
        await queryRunner.query(`DROP TABLE \`driver_services_service\``);
        await queryRunner.query(`DROP TABLE \`car_color\``);
        await queryRunner.query(`DROP INDEX \`REL_f3cbfdc82019ea5fda5b5adfb8\` ON \`driver\``);
        await queryRunner.query(`DROP INDEX \`IDX_e6297db8efeb6cbdb2281e4d89\` ON \`driver\``);
        await queryRunner.query(`DROP TABLE \`driver\``);
        await queryRunner.query(`DROP TABLE \`driver_wallet\``);
        await queryRunner.query(`DROP TABLE \`driver_transaction\``);
        await queryRunner.query(`DROP TABLE \`car\``);
        await queryRunner.query(`CREATE UNIQUE INDEX \`IDX_092affee7993ba757fad472be1\` ON \`operator\` (\`mediaId\`)`);
    }

}
