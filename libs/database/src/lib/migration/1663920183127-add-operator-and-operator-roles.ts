import { MigrationInterface, QueryRunner } from "typeorm";

export class addOperatorAndOperatorRoles1663920183127 implements MigrationInterface {
    name = 'addOperatorAndOperatorRoles1663920183127'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`CREATE TABLE \`operator\` (\`id\` int NOT NULL AUTO_INCREMENT, \`firstName\` varchar(255) NULL, \`lastName\` varchar(255) NULL, \`userName\` varchar(255) NOT NULL, \`password\` varchar(255) NOT NULL DEFAULT 'admin', \`mobileNumber\` bigint NULL, \`email\` varchar(255) NULL, \`address\` varchar(255) NULL, \`roleId\` int NULL, UNIQUE INDEX \`IDX_c889287e2951bc87f7af326e5d\` (\`userName\`), UNIQUE INDEX \`IDX_ba48103911b18bcd29c9039c98\` (\`mobileNumber\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`CREATE TABLE \`operator_role\` (\`id\` int NOT NULL AUTO_INCREMENT, \`title\` varchar(255) NOT NULL, \`permissions\` set ('Drivers_View', 'Drivers_Edit', 'Riders_View', 'Riders_Edit', 'Regions_View', 'Regions_Edit', 'Services_View', 'Services_Edit', 'Complaints_View', 'Complaints_Edit', 'Coupons_View', 'Coupons_Edit', 'Announcements_View', 'Announcements_Edit', 'Requests_View', 'Fleets_View', 'Fleets_Edit', 'Gateways_View', 'Gateways_Edit', 'Users_View', 'Users_Edit', 'Cars_View', 'Cars_Edit', 'FleetWallet_View', 'FleetWallet_Edit', 'ProviderWallet_View', 'ProviderWallet_Edit', 'DriverWallet_View', 'DriverWallet_Edit', 'RiderWallet_View', 'RiderWallet_Edit') NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`);
        await queryRunner.query(`ALTER TABLE \`operator\` ADD CONSTRAINT \`FK_6c951b4fe5f84a6000a741908ac\` FOREIGN KEY (\`roleId\`) REFERENCES \`operator_role\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE \`operator\` DROP FOREIGN KEY \`FK_6c951b4fe5f84a6000a741908ac\``);
        await queryRunner.query(`DROP TABLE \`operator_role\``);
        await queryRunner.query(`DROP INDEX \`IDX_ba48103911b18bcd29c9039c98\` ON \`operator\``);
        await queryRunner.query(`DROP INDEX \`IDX_c889287e2951bc87f7af326e5d\` ON \`operator\``);
        await queryRunner.query(`DROP TABLE \`operator\``);
    }

}
