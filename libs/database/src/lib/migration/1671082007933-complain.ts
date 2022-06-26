import { MigrationInterface, QueryRunner } from 'typeorm';

export class complain1671082007933 implements MigrationInterface {
  name = 'complain1671082007933';

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `DROP INDEX \`IDX_1828ae59cb61e9e6edf91c266b\` ON \`order\``
    );
    await queryRunner.query(
      `CREATE TABLE \`complaint\` (\`id\` int NOT NULL AUTO_INCREMENT, \`inscriptionTimestamp\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`orderId\` int NOT NULL, \`requestedByDriver\` tinyint NOT NULL, \`subject\` varchar(255) NOT NULL, \`content\` varchar(255) NULL, \`status\` enum ('Submitted', 'UnderInvestigation', 'Resolved') NOT NULL DEFAULT 'Submitted', PRIMARY KEY (\`id\`)) ENGINE=InnoDB`
    );
    await queryRunner.query(
      `CREATE TABLE \`complaint_activity\` (\`id\` int NOT NULL AUTO_INCREMENT, \`type\` enum ('AssignedToOperator', 'Update', 'Resolved') NOT NULL, \`assignedToId\` int NULL, \`comment\` varchar(255) NULL, \`complaintId\` int NOT NULL, \`actorId\` int NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`
    );
    await queryRunner.query(
      `ALTER TABLE \`complaint\` ADD CONSTRAINT \`FK_8d4fee66470655872122ee1d609\` FOREIGN KEY (\`orderId\`) REFERENCES \`order\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
    await queryRunner.query(
      `ALTER TABLE \`complaint_activity\` ADD CONSTRAINT \`FK_1eb5cf7d6bd1cce752f05517889\` FOREIGN KEY (\`actorId\`) REFERENCES \`operator\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
    await queryRunner.query(
      `ALTER TABLE \`complaint_activity\` ADD CONSTRAINT \`FK_4f980d68f06fd0ef5fafd545bd8\` FOREIGN KEY (\`assignedToId\`) REFERENCES \`operator\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
    await queryRunner.query(
      `ALTER TABLE \`complaint_activity\` ADD CONSTRAINT \`FK_b0bd5c9e9ecc76bc56de912dcb7\` FOREIGN KEY (\`complaintId\`) REFERENCES \`complaint\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `ALTER TABLE \`complaint_activity\` DROP FOREIGN KEY \`FK_b0bd5c9e9ecc76bc56de912dcb7\``
    );
    await queryRunner.query(
      `ALTER TABLE \`complaint_activity\` DROP FOREIGN KEY \`FK_4f980d68f06fd0ef5fafd545bd8\``
    );
    await queryRunner.query(
      `ALTER TABLE \`complaint_activity\` DROP FOREIGN KEY \`FK_1eb5cf7d6bd1cce752f05517889\``
    );
    await queryRunner.query(
      `ALTER TABLE \`complaint\` DROP FOREIGN KEY \`FK_8d4fee66470655872122ee1d609\``
    );
    await queryRunner.query(`DROP TABLE \`complaint_activity\``);
    await queryRunner.query(`DROP TABLE \`complaint\``);
    await queryRunner.query(
      `CREATE UNIQUE INDEX \`IDX_1828ae59cb61e9e6edf91c266b\` ON \`order\` (\`reviewId\`)`
    );
  }
}
