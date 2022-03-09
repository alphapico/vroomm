import { MigrationInterface, QueryRunner } from 'typeorm';

export class seedAdminOperator1664443203787 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `INSERT INTO operator_role (title, permissions) VALUES ('admin', 'Drivers_View,Drivers_Edit,Riders_View,Riders_Edit,Regions_View,Regions_Edit,Services_View,Services_Edit,Complaints_View,Complaints_Edit,Coupons_View,Coupons_Edit,Announcements_View,Announcements_Edit,Requests_View,Fleets_View,Fleets_Edit,Gateways_View,Gateways_Edit,Users_View,Users_Edit,Cars_View,Cars_Edit,FleetWallet_View,FleetWallet_Edit,ProviderWallet_View,ProviderWallet_Edit,DriverWallet_View,DriverWallet_Edit,RiderWallet_View,RiderWallet_Edit');`
    );
    await queryRunner.query(
      `INSERT INTO operator (userName, password,firstName, lastName, roleId) VALUES ('admin', 'admin', 'John', 'Doe', 1);`
    );
  }

  // eslint-disable-next-line @typescript-eslint/no-empty-function
  public async down(queryRunner: QueryRunner): Promise<void> {}
}
