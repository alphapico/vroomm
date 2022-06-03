import { MigrationInterface, QueryRunner } from 'typeorm';

export class paymentGatewayForDriverTransaction1666669213217
  implements MigrationInterface
{
  name = 'paymentGatewayForDriverTransaction1666669213217';

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `ALTER TABLE \`driver_transaction\` ADD \`paymentGatewayId\` int NULL`
    );
    await queryRunner.query(
      `ALTER TABLE \`driver_transaction\` ADD CONSTRAINT \`FK_eca1cd5fd25685c46847e6f0b36\` FOREIGN KEY (\`paymentGatewayId\`) REFERENCES \`payment_gateway\`(\`id\`) ON DELETE NO ACTION ON UPDATE NO ACTION`
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `ALTER TABLE \`driver_transaction\` DROP FOREIGN KEY \`FK_eca1cd5fd25685c46847e6f0b36\``
    );
    await queryRunner.query(
      `ALTER TABLE \`driver_transaction\` DROP COLUMN \`paymentGatewayId\``
    );
  }
}
