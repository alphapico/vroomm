import { MigrationInterface, QueryRunner } from 'typeorm';

export class replaceRiderWithPassenger1666610658734
  implements MigrationInterface
{
  name = 'replaceRiderWithPassenger1666610658734';

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `ALTER TABLE \`operator_role\` CHANGE \`permissions\` \`permissions\` set ('Drivers_View', 'Drivers_Edit', 'Passengers_View', 'Passengers_Edit', 'Regions_View', 'Regions_Edit', 'Services_View', 'Services_Edit', 'Complaints_View', 'Complaints_Edit', 'Coupons_View', 'Coupons_Edit', 'Announcements_View', 'Announcements_Edit', 'Requests_View', 'Fleets_View', 'Fleets_Edit', 'Gateways_View', 'Gateways_Edit', 'Users_View', 'Users_Edit', 'Cars_View', 'Cars_Edit', 'FleetWallet_View', 'FleetWallet_Edit', 'ProviderWallet_View', 'ProviderWallet_Edit', 'DriverWallet_View', 'DriverWallet_Edit', 'PassengerWallet_View', 'PassengerWallet_Edit') NOT NULL`
    );
    await queryRunner.query(
      `ALTER TABLE \`order_activity\` CHANGE \`type\` \`type\` enum ('RequestedByOperator', 'BookedByOperator', 'RequestedByPassenger', 'BookedByPassenger', 'DriverAccepted', 'ArrivedToPickupPoint', 'CanceledByDriver', 'CanceledByPassenger', 'CanceledByOperator', 'Started', 'ArrivedToDestination', 'Paid', 'Reviewed', 'Expired') NOT NULL`
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `ALTER TABLE \`order_activity\` CHANGE \`type\` \`type\` enum ('RequestedByOperator', 'BookedByOperator', 'RequestedByRider', 'BookedByRider', 'DriverAccepted', 'ArrivedToPickupPoint', 'CanceledByDriver', 'CanceledByRider', 'CanceledByOperator', 'Started', 'ArrivedToDestination', 'Paid', 'Reviewed', 'Expired') NOT NULL`
    );
    await queryRunner.query(
      `ALTER TABLE \`operator_role\` CHANGE \`permissions\` \`permissions\` set ('Drivers_View', 'Drivers_Edit', 'Riders_View', 'Riders_Edit', 'Regions_View', 'Regions_Edit', 'Services_View', 'Services_Edit', 'Complaints_View', 'Complaints_Edit', 'Coupons_View', 'Coupons_Edit', 'Announcements_View', 'Announcements_Edit', 'Requests_View', 'Fleets_View', 'Fleets_Edit', 'Gateways_View', 'Gateways_Edit', 'Users_View', 'Users_Edit', 'Cars_View', 'Cars_Edit', 'FleetWallet_View', 'FleetWallet_Edit', 'ProviderWallet_View', 'ProviderWallet_Edit', 'DriverWallet_View', 'DriverWallet_Edit', 'RiderWallet_View', 'RiderWallet_Edit') NOT NULL`
    );
  }
}
