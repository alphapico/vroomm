import { MigrationInterface, QueryRunner } from 'typeorm';

export class paymentAndPaymentGateway1671440975676
  implements MigrationInterface
{
  name = 'paymentAndPaymentGateway1671440975676';

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `CREATE TABLE \`payment_gateway\` (\`id\` int NOT NULL AUTO_INCREMENT, \`title\` varchar(255) NOT NULL, \`type\` enum ('stripe', 'braintree', 'paypal', 'link') NOT NULL, \`publicKey\` varchar(255) NULL, \`privateKey\` varchar(255) NOT NULL, \`merchantId\` varchar(255) NULL, \`saltKey\` varchar(255) NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`
    );
    await queryRunner.query(
      `CREATE TABLE \`payment\` (\`id\` int NOT NULL AUTO_INCREMENT, \`status\` enum ('processing', 'success', 'canceled', 'failed') NOT NULL DEFAULT 'processing', \`amount\` int NOT NULL, \`currency\` varchar(255) NOT NULL, \`transactionNumber\` varchar(255) NOT NULL, \`userType\` varchar(255) NOT NULL, \`userId\` varchar(255) NOT NULL, \`gatewayId\` int NOT NULL, \`returnUrl\` varchar(255) NOT NULL, PRIMARY KEY (\`id\`)) ENGINE=InnoDB`
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`DROP TABLE \`payment\``);
    await queryRunner.query(`DROP TABLE \`payment_gateway\``);
  }
}
