import { MigrationInterface, QueryRunner } from 'typeorm';

export class giftCard1671091604091 implements MigrationInterface {
  name = 'giftCard1671091604091';

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `CREATE TABLE \`gift_card\` (\`id\` int NOT NULL AUTO_INCREMENT, \`code\` varchar(255) NOT NULL, \`currency\` varchar(3) NOT NULL, \`amount\` float(10,2) NOT NULL, \`isUsed\` tinyint NOT NULL, \`availableTimestamp\` datetime NOT NULL, \`expirationTimestamp\` datetime NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger_transaction\` ADD \`giftCardId\` int NULL`
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger_transaction\` ADD UNIQUE INDEX \`IDX_aa88ce0136214c1b1b541d496e\` (\`giftCardId\`)`
    );
    await queryRunner.query(
      `CREATE UNIQUE INDEX \`REL_aa88ce0136214c1b1b541d496e\` ON \`passenger_transaction\` (\`giftCardId\`)`
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger_transaction\` ADD CONSTRAINT \`FK_aa88ce0136214c1b1b541d496ea\` FOREIGN KEY (\`giftCardId\`) REFERENCES \`gift_card\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `ALTER TABLE \`passenger_transaction\` DROP FOREIGN KEY \`FK_aa88ce0136214c1b1b541d496ea\``
    );
    await queryRunner.query(
      `DROP INDEX \`REL_aa88ce0136214c1b1b541d496e\` ON \`passenger_transaction\``
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger_transaction\` DROP INDEX \`IDX_aa88ce0136214c1b1b541d496e\``
    );
    await queryRunner.query(
      `ALTER TABLE \`passenger_transaction\` DROP COLUMN \`giftCardId\``
    );
    await queryRunner.query(`DROP TABLE \`gift_card\``);
  }
}
