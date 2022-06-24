import { MigrationInterface, QueryRunner } from 'typeorm';

export class feedback1671078827992 implements MigrationInterface {
  name = 'feedback1671078827992';

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `CREATE TABLE \`review_parameter\` (\`id\` int NOT NULL AUTO_INCREMENT, \`title\` varchar(255) NOT NULL, \`isGood\` tinyint NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`
    );
    await queryRunner.query(
      `CREATE TABLE \`order_review\` (\`id\` int NOT NULL AUTO_INCREMENT, \`reviewTimestamp\` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6), \`score\` tinyint NOT NULL, \`review\` varchar(255) NULL, \`driverId\` int NOT NULL, \`orderId\` int NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`
    );
    await queryRunner.query(
      `CREATE TABLE \`review_parameter_feedbacks_order_review\` (\`reviewParameterId\` int NOT NULL, \`orderReviewId\` int NOT NULL, INDEX \`IDX_50cd86b9ee4804363da30cbd86\` (\`reviewParameterId\`), INDEX \`IDX_2bc85dc3e146d9c6202a3f4261\` (\`orderReviewId\`), PRIMARY KEY (\`reviewParameterId\`, \`orderReviewId\`)) ENGINE=InnoDB`
    );
    await queryRunner.query(`ALTER TABLE \`order\` ADD \`reviewId\` int NULL`);
    await queryRunner.query(
      `ALTER TABLE \`order\` ADD UNIQUE INDEX \`IDX_1828ae59cb61e9e6edf91c266b\` (\`reviewId\`)`
    );
    await queryRunner.query(
      `CREATE UNIQUE INDEX \`REL_1828ae59cb61e9e6edf91c266b\` ON \`order\` (\`reviewId\`)`
    );
    await queryRunner.query(
      `ALTER TABLE \`order_review\` ADD CONSTRAINT \`FK_f5fcd6a1444470b7b01dc97e489\` FOREIGN KEY (\`driverId\`) REFERENCES \`driver\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
    await queryRunner.query(
      `ALTER TABLE \`order\` ADD CONSTRAINT \`FK_1828ae59cb61e9e6edf91c266bb\` FOREIGN KEY (\`reviewId\`) REFERENCES \`order_review\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
    await queryRunner.query(
      `ALTER TABLE \`review_parameter_feedbacks_order_review\` ADD CONSTRAINT \`FK_50cd86b9ee4804363da30cbd865\` FOREIGN KEY (\`reviewParameterId\`) REFERENCES \`review_parameter\`(\`id\`) ON DELETE CASCADE ON UPDATE CASCADE`
    );
    await queryRunner.query(
      `ALTER TABLE \`review_parameter_feedbacks_order_review\` ADD CONSTRAINT \`FK_2bc85dc3e146d9c6202a3f42617\` FOREIGN KEY (\`orderReviewId\`) REFERENCES \`order_review\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `ALTER TABLE \`review_parameter_feedbacks_order_review\` DROP FOREIGN KEY \`FK_2bc85dc3e146d9c6202a3f42617\``
    );
    await queryRunner.query(
      `ALTER TABLE \`review_parameter_feedbacks_order_review\` DROP FOREIGN KEY \`FK_50cd86b9ee4804363da30cbd865\``
    );
    await queryRunner.query(
      `ALTER TABLE \`order\` DROP FOREIGN KEY \`FK_1828ae59cb61e9e6edf91c266bb\``
    );
    await queryRunner.query(
      `ALTER TABLE \`order_review\` DROP FOREIGN KEY \`FK_f5fcd6a1444470b7b01dc97e489\``
    );
    await queryRunner.query(
      `DROP INDEX \`REL_1828ae59cb61e9e6edf91c266b\` ON \`order\``
    );
    await queryRunner.query(
      `ALTER TABLE \`order\` DROP INDEX \`IDX_1828ae59cb61e9e6edf91c266b\``
    );
    await queryRunner.query(`ALTER TABLE \`order\` DROP COLUMN \`reviewId\``);
    await queryRunner.query(
      `DROP INDEX \`IDX_2bc85dc3e146d9c6202a3f4261\` ON \`review_parameter_feedbacks_order_review\``
    );
    await queryRunner.query(
      `DROP INDEX \`IDX_50cd86b9ee4804363da30cbd86\` ON \`review_parameter_feedbacks_order_review\``
    );
    await queryRunner.query(
      `DROP TABLE \`review_parameter_feedbacks_order_review\``
    );
    await queryRunner.query(`DROP TABLE \`order_review\``);
    await queryRunner.query(`DROP TABLE \`review_parameter\``);
  }
}
