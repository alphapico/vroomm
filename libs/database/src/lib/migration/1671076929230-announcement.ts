import { MigrationInterface, QueryRunner } from 'typeorm';

export class announcement1671076929230 implements MigrationInterface {
  name = 'announcement1671076929230';

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `CREATE TABLE \`promotion\` (\`id\` int NOT NULL AUTO_INCREMENT, \`userType\` set ('Driver', 'Passenger', 'Operator') NOT NULL DEFAULT 'Passenger', \`startTimestamp\` datetime NOT NULL, \`expirationTimestamp\` datetime NOT NULL, \`title\` varchar(255) NOT NULL, \`url\` varchar(255) NOT NULL, \`description\` varchar(255) NOT NULL, \`mediaId\` int NULL, UNIQUE INDEX \`REL_5de52c7f8e5ba20f85f2881909\` (\`mediaId\`), PRIMARY KEY (\`id\`)) ENGINE=InnoDB`
    );
    await queryRunner.query(
      `ALTER TABLE \`promotion\` ADD CONSTRAINT \`FK_5de52c7f8e5ba20f85f28819097\` FOREIGN KEY (\`mediaId\`) REFERENCES \`media\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `ALTER TABLE \`promotion\` DROP FOREIGN KEY \`FK_5de52c7f8e5ba20f85f28819097\``
    );
    await queryRunner.query(
      `DROP INDEX \`REL_5de52c7f8e5ba20f85f2881909\` ON \`promotion\``
    );
    await queryRunner.query(`DROP TABLE \`promotion\``);
  }
}
