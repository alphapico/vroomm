import { MigrationInterface, QueryRunner } from 'typeorm';

export class seed2AdminOperator1666610807218 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `INSERT INTO operator_role (title, permissions) VALUES ('admin', 'Drivers_View,Drivers_Edit,Passengers_View,Passengers_Edit,Regions_View,Regions_Edit,Services_View,Services_Edit,Complaints_View,Complaints_Edit,Coupons_View,Coupons_Edit,Announcements_View,Announcements_Edit,Requests_View,Fleets_View,Fleets_Edit,Gateways_View,Gateways_Edit,Users_View,Users_Edit,Cars_View,Cars_Edit,FleetWallet_View,FleetWallet_Edit,ProviderWallet_View,ProviderWallet_Edit,DriverWallet_View,DriverWallet_Edit,PassengerWallet_View,PassengerWallet_Edit');`
    );
    await queryRunner.query(
      `INSERT INTO operator (userName, password,firstName, lastName, roleId) VALUES ('admin', 'admin', 'John', 'Doe', 2);`
    );
  }

  // eslint-disable-next-line @typescript-eslint/no-empty-function
  public async down(queryRunner: QueryRunner): Promise<void> {}
}
