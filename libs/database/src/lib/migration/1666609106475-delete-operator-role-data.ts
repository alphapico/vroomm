import { MigrationInterface, QueryRunner } from 'typeorm';

export class deleteOperatorRoleData1666609106475 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`DELETE FROM operator WHERE id = 1`);
    await queryRunner.query(`DELETE FROM operator_role WHERE id = 1`);
  }

  // eslint-disable-next-line @typescript-eslint/no-empty-function
  public async down(queryRunner: QueryRunner): Promise<void> {}
}
