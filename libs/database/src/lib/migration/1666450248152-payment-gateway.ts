import { MigrationInterface, QueryRunner } from "typeorm";

export class paymentGateway1666450248152 implements MigrationInterface {
    name = 'paymentGateway1666450248152'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE \`payment_gateway\` (\`id\` int NOT NULL AUTO_INCREMENT, \`enabled\` tinyint NOT NULL DEFAULT 1, \`title\` varchar(255) NOT NULL, \`type\` enum ('stripe', 'braintree', 'paypal', 'link') NOT NULL, \`publicKey\` varchar(1000) NULL, \`privateKey\` varchar(255) NOT NULL, \`saltKey\` varchar(255) NULL, \`merchantId\` varchar(255) NULL, \`mediaId\` int NULL, UNIQUE INDEX \`REL_897f64218b621b1072a19280a7\` (\`mediaId\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`payment\` (\`id\` int NOT NULL AUTO_INCREMENT, \`status\` enum ('processing', 'success', 'canceled', 'failed') NOT NULL DEFAULT 'processing', \`amount\` int NOT NULL, \`currency\` varchar(255) NOT NULL, \`transactionNumber\` varchar(255) NOT NULL, \`userType\` varchar(255) NOT NULL, \`userId\` varchar(255) NOT NULL, \`gatewayId\` int NOT NULL, \`returnUrl\` varchar(255) NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`ALTER TABLE \`passenger_transaction\` ADD \`paymentGatewayId\` int NULL`);
        await queryRunner.query(`ALTER TABLE \`service\` CHANGE \`availableTimeFrom\` \`availableTimeFrom\` time NOT NULL DEFAULT '00:00'`);
        await queryRunner.query(`ALTER TABLE \`service\` CHANGE \`availableTimeTo\` \`availableTimeTo\` time NOT NULL DEFAULT '23:59'`);
        await queryRunner.query(`ALTER TABLE \`passenger_transaction\` ADD CONSTRAINT \`FK_d2236013ec5bc9ee60caf9666c5\` FOREIGN KEY (\`paymentGatewayId\`) REFERENCES \`payment_gateway\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
        await queryRunner.query(`ALTER TABLE \`payment_gateway\` ADD CONSTRAINT \`FK_897f64218b621b1072a19280a7e\` FOREIGN KEY (\`mediaId\`) REFERENCES \`media\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`payment_gateway\` DROP FOREIGN KEY \`FK_897f64218b621b1072a19280a7e\``);
        await queryRunner.query(`ALTER TABLE \`passenger_transaction\` DROP FOREIGN KEY \`FK_d2236013ec5bc9ee60caf9666c5\``);
        await queryRunner.query(`ALTER TABLE \`service\` CHANGE \`availableTimeTo\` \`availableTimeTo\` time NOT NULL DEFAULT '23:59:00'`);
        await queryRunner.query(`ALTER TABLE \`service\` CHANGE \`availableTimeFrom\` \`availableTimeFrom\` time NOT NULL DEFAULT '00:00:00'`);
        await queryRunner.query(`ALTER TABLE \`passenger_transaction\` DROP COLUMN \`paymentGatewayId\``);
        await queryRunner.query(`DROP TABLE \`payment\``);
        await queryRunner.query(`DROP INDEX \`REL_897f64218b621b1072a19280a7\` ON \`payment_gateway\``);
        await queryRunner.query(`DROP TABLE \`payment_gateway\``);
    }

}
