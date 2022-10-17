// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import '../scalars/timestamp.dart';
import '../scalars/datetime.dart';
import '../scalars/connection_cursor.dart';
part 'graphql_api.graphql.g.dart';

mixin BasicProfileMixin {
  late String mobileNumber;
  String? firstName;
  String? lastName;
  int? searchDistance;
  BasicProfileMixin$Media? media;
  String? softRejectionNote;
  @JsonKey(unknownEnumValue: DriverStatus.artemisUnknown)
  late DriverStatus status;
  late List<BasicProfileMixin$Order> currentOrders;
  late List<BasicProfileMixin$DriverWallet> wallets;
}
mixin CurrentOrderMixin {
  late String id;
  @JsonKey(
      fromJson: fromGraphQLTimestampToDartDateTime,
      toJson: fromDartDateTimeToGraphQLTimestamp)
  late DateTime createdOn;
  @JsonKey(
      fromJson: fromGraphQLTimestampToDartDateTime,
      toJson: fromDartDateTimeToGraphQLTimestamp)
  late DateTime expectedTimestamp;
  @JsonKey(unknownEnumValue: OrderStatus.artemisUnknown)
  late OrderStatus status;
  late String currency;
  late double costBest;
  late double costAfterCoupon;
  late double paidAmount;
  @JsonKey(
      fromJson: fromGraphQLTimestampNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLTimestampNullable)
  DateTime? etaPickup;
  late double tipAmount;
  late List<CurrentOrderMixin$Point> directions;
  late List<CurrentOrderMixin$Point> points;
  late CurrentOrderMixin$Service service;
  late List<CurrentOrderMixin$ServiceOption> options;
  late List<String> addresses;
  late CurrentOrderMixin$Passenger passenger;
}
mixin PointMixin {
  late double lat;
  late double lng;
}
mixin AvailableOrderMixin {
  late String id;
  @JsonKey(unknownEnumValue: OrderStatus.artemisUnknown)
  late OrderStatus status;
  late String currency;
  late double costBest;
  late List<String> addresses;
  late int distanceBest;
  late int durationBest;
  late List<AvailableOrderMixin$Point> directions;
  late List<AvailableOrderMixin$ServiceOption> options;
  late AvailableOrderMixin$Service service;
  late List<AvailableOrderMixin$Point> points;
}

@JsonSerializable(explicitToJson: true)
class UpdateProfile$Mutation$Driver extends JsonSerializable
    with EquatableMixin {
  UpdateProfile$Mutation$Driver();

  factory UpdateProfile$Mutation$Driver.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfile$Mutation$DriverFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$UpdateProfile$Mutation$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateProfile$Mutation extends JsonSerializable with EquatableMixin {
  UpdateProfile$Mutation();

  factory UpdateProfile$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfile$MutationFromJson(json);

  late UpdateProfile$Mutation$Driver updateOneDriver;

  @override
  List<Object?> get props => [updateOneDriver];
  @override
  Map<String, dynamic> toJson() => _$UpdateProfile$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverInput extends JsonSerializable with EquatableMixin {
  UpdateDriverInput({
    this.firstName,
    this.lastName,
    this.status,
    this.certificateNumber,
    this.email,
    this.carProductionYear,
    this.carPlate,
    this.mediaId,
    this.gender,
    this.accountNumber,
    this.bankName,
    this.bankRoutingNumber,
    this.bankSwift,
    this.address,
    this.carModelId,
    this.carColorId,
    this.notificationPlayerId,
    this.searchDistance,
  });

  factory UpdateDriverInput.fromJson(Map<String, dynamic> json) =>
      _$UpdateDriverInputFromJson(json);

  String? firstName;

  String? lastName;

  @JsonKey(unknownEnumValue: DriverStatus.artemisUnknown)
  DriverStatus? status;

  String? certificateNumber;

  String? email;

  int? carProductionYear;

  String? carPlate;

  String? mediaId;

  @JsonKey(unknownEnumValue: Gender.artemisUnknown)
  Gender? gender;

  String? accountNumber;

  String? bankName;

  String? bankRoutingNumber;

  String? bankSwift;

  String? address;

  String? carModelId;

  String? carColorId;

  String? notificationPlayerId;

  int? searchDistance;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        status,
        certificateNumber,
        email,
        carProductionYear,
        carPlate,
        mediaId,
        gender,
        accountNumber,
        bankName,
        bankRoutingNumber,
        bankSwift,
        address,
        carModelId,
        carColorId,
        notificationPlayerId,
        searchDistance
      ];
  @override
  Map<String, dynamic> toJson() => _$UpdateDriverInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDriver$Query$Driver$Media extends JsonSerializable
    with EquatableMixin {
  GetDriver$Query$Driver$Media();

  factory GetDriver$Query$Driver$Media.fromJson(Map<String, dynamic> json) =>
      _$GetDriver$Query$Driver$MediaFromJson(json);

  late String id;

  late String address;

  @override
  List<Object?> get props => [id, address];
  @override
  Map<String, dynamic> toJson() => _$GetDriver$Query$Driver$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDriver$Query$Driver extends JsonSerializable with EquatableMixin {
  GetDriver$Query$Driver();

  factory GetDriver$Query$Driver.fromJson(Map<String, dynamic> json) =>
      _$GetDriver$Query$DriverFromJson(json);

  late String id;

  @JsonKey(unknownEnumValue: DriverStatus.artemisUnknown)
  late DriverStatus status;

  String? firstName;

  String? lastName;

  @JsonKey(unknownEnumValue: Gender.artemisUnknown)
  Gender? gender;

  String? email;

  late String mobileNumber;

  String? accountNumber;

  String? bankName;

  String? bankRoutingNumber;

  String? address;

  late List<GetDriver$Query$Driver$Media> documents;

  String? bankSwift;

  GetDriver$Query$Driver$Media? media;

  String? carPlate;

  int? carProductionYear;

  String? certificateNumber;

  String? carColorId;

  String? carModelId;

  @override
  List<Object?> get props => [
        id,
        status,
        firstName,
        lastName,
        gender,
        email,
        mobileNumber,
        accountNumber,
        bankName,
        bankRoutingNumber,
        address,
        documents,
        bankSwift,
        media,
        carPlate,
        carProductionYear,
        certificateNumber,
        carColorId,
        carModelId
      ];
  @override
  Map<String, dynamic> toJson() => _$GetDriver$Query$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDriver$Query$CarModel extends JsonSerializable with EquatableMixin {
  GetDriver$Query$CarModel();

  factory GetDriver$Query$CarModel.fromJson(Map<String, dynamic> json) =>
      _$GetDriver$Query$CarModelFromJson(json);

  late String id;

  late String name;

  @override
  List<Object?> get props => [id, name];
  @override
  Map<String, dynamic> toJson() => _$GetDriver$Query$CarModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDriver$Query$CarColor extends JsonSerializable with EquatableMixin {
  GetDriver$Query$CarColor();

  factory GetDriver$Query$CarColor.fromJson(Map<String, dynamic> json) =>
      _$GetDriver$Query$CarColorFromJson(json);

  late String id;

  late String name;

  @override
  List<Object?> get props => [id, name];
  @override
  Map<String, dynamic> toJson() => _$GetDriver$Query$CarColorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDriver$Query extends JsonSerializable with EquatableMixin {
  GetDriver$Query();

  factory GetDriver$Query.fromJson(Map<String, dynamic> json) =>
      _$GetDriver$QueryFromJson(json);

  late GetDriver$Query$Driver driver;

  late List<GetDriver$Query$CarModel> carModels;

  late List<GetDriver$Query$CarColor> carColors;

  @override
  List<Object?> get props => [driver, carModels, carColors];
  @override
  Map<String, dynamic> toJson() => _$GetDriver$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Login$Mutation$Login extends JsonSerializable with EquatableMixin {
  Login$Mutation$Login();

  factory Login$Mutation$Login.fromJson(Map<String, dynamic> json) =>
      _$Login$Mutation$LoginFromJson(json);

  late String jwtToken;

  @override
  List<Object?> get props => [jwtToken];
  @override
  Map<String, dynamic> toJson() => _$Login$Mutation$LoginToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Login$Mutation extends JsonSerializable with EquatableMixin {
  Login$Mutation();

  factory Login$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Login$MutationFromJson(json);

  late Login$Mutation$Login login;

  @override
  List<Object?> get props => [login];
  @override
  Map<String, dynamic> toJson() => _$Login$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SetDocumentsOnDriver$Mutation$Driver extends JsonSerializable
    with EquatableMixin, BasicProfileMixin {
  SetDocumentsOnDriver$Mutation$Driver();

  factory SetDocumentsOnDriver$Mutation$Driver.fromJson(
          Map<String, dynamic> json) =>
      _$SetDocumentsOnDriver$Mutation$DriverFromJson(json);

  @override
  List<Object?> get props => [
        mobileNumber,
        firstName,
        lastName,
        searchDistance,
        media,
        softRejectionNote,
        status,
        currentOrders,
        wallets
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$SetDocumentsOnDriver$Mutation$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SetDocumentsOnDriver$Mutation extends JsonSerializable
    with EquatableMixin {
  SetDocumentsOnDriver$Mutation();

  factory SetDocumentsOnDriver$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SetDocumentsOnDriver$MutationFromJson(json);

  late SetDocumentsOnDriver$Mutation$Driver updateOneDriver;

  late SetDocumentsOnDriver$Mutation$Driver setDocumentsOnDriver;

  @override
  List<Object?> get props => [updateOneDriver, setDocumentsOnDriver];
  @override
  Map<String, dynamic> toJson() => _$SetDocumentsOnDriver$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BasicProfileMixin$Media extends JsonSerializable with EquatableMixin {
  BasicProfileMixin$Media();

  factory BasicProfileMixin$Media.fromJson(Map<String, dynamic> json) =>
      _$BasicProfileMixin$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() => _$BasicProfileMixin$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BasicProfileMixin$Order extends JsonSerializable
    with EquatableMixin, CurrentOrderMixin {
  BasicProfileMixin$Order();

  factory BasicProfileMixin$Order.fromJson(Map<String, dynamic> json) =>
      _$BasicProfileMixin$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        createdOn,
        expectedTimestamp,
        status,
        currency,
        costBest,
        costAfterCoupon,
        paidAmount,
        etaPickup,
        tipAmount,
        directions,
        points,
        service,
        options,
        addresses,
        passenger
      ];
  @override
  Map<String, dynamic> toJson() => _$BasicProfileMixin$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BasicProfileMixin$DriverWallet extends JsonSerializable
    with EquatableMixin {
  BasicProfileMixin$DriverWallet();

  factory BasicProfileMixin$DriverWallet.fromJson(Map<String, dynamic> json) =>
      _$BasicProfileMixin$DriverWalletFromJson(json);

  late double balance;

  late String currency;

  @override
  List<Object?> get props => [balance, currency];
  @override
  Map<String, dynamic> toJson() => _$BasicProfileMixin$DriverWalletToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Point extends JsonSerializable
    with EquatableMixin, PointMixin {
  CurrentOrderMixin$Point();

  factory CurrentOrderMixin$Point.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$PointFromJson(json);

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() => _$CurrentOrderMixin$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Service extends JsonSerializable with EquatableMixin {
  CurrentOrderMixin$Service();

  factory CurrentOrderMixin$Service.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$ServiceFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() => _$CurrentOrderMixin$ServiceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$ServiceOption extends JsonSerializable
    with EquatableMixin {
  CurrentOrderMixin$ServiceOption();

  factory CurrentOrderMixin$ServiceOption.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$ServiceOptionFromJson(json);

  late String id;

  late String name;

  @JsonKey(unknownEnumValue: ServiceOptionIcon.artemisUnknown)
  late ServiceOptionIcon icon;

  @override
  List<Object?> get props => [id, name, icon];
  @override
  Map<String, dynamic> toJson() =>
      _$CurrentOrderMixin$ServiceOptionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Passenger$Media extends JsonSerializable
    with EquatableMixin {
  CurrentOrderMixin$Passenger$Media();

  factory CurrentOrderMixin$Passenger$Media.fromJson(
          Map<String, dynamic> json) =>
      _$CurrentOrderMixin$Passenger$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$CurrentOrderMixin$Passenger$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Passenger extends JsonSerializable with EquatableMixin {
  CurrentOrderMixin$Passenger();

  factory CurrentOrderMixin$Passenger.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$PassengerFromJson(json);

  late String mobileNumber;

  String? firstName;

  String? lastName;

  CurrentOrderMixin$Passenger$Media? media;

  @override
  List<Object?> get props => [mobileNumber, firstName, lastName, media];
  @override
  Map<String, dynamic> toJson() => _$CurrentOrderMixin$PassengerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteUser$Mutation$Driver extends JsonSerializable with EquatableMixin {
  DeleteUser$Mutation$Driver();

  factory DeleteUser$Mutation$Driver.fromJson(Map<String, dynamic> json) =>
      _$DeleteUser$Mutation$DriverFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$DeleteUser$Mutation$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DeleteUser$Mutation extends JsonSerializable with EquatableMixin {
  DeleteUser$Mutation();

  factory DeleteUser$Mutation.fromJson(Map<String, dynamic> json) =>
      _$DeleteUser$MutationFromJson(json);

  late DeleteUser$Mutation$Driver deleteUser;

  @override
  List<Object?> get props => [deleteUser];
  @override
  Map<String, dynamic> toJson() => _$DeleteUser$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Me$Query$Driver extends JsonSerializable
    with EquatableMixin, BasicProfileMixin {
  Me$Query$Driver();

  factory Me$Query$Driver.fromJson(Map<String, dynamic> json) =>
      _$Me$Query$DriverFromJson(json);

  @override
  List<Object?> get props => [
        mobileNumber,
        firstName,
        lastName,
        searchDistance,
        media,
        softRejectionNote,
        status,
        currentOrders,
        wallets
      ];
  @override
  Map<String, dynamic> toJson() => _$Me$Query$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Me$Query extends JsonSerializable with EquatableMixin {
  Me$Query();

  factory Me$Query.fromJson(Map<String, dynamic> json) =>
      _$Me$QueryFromJson(json);

  late Me$Query$Driver driver;

  @JsonKey(unknownEnumValue: VersionStatus.artemisUnknown)
  late VersionStatus requireUpdate;

  @override
  List<Object?> get props => [driver, requireUpdate];
  @override
  Map<String, dynamic> toJson() => _$Me$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AvailableOrders$Query$Order extends JsonSerializable
    with EquatableMixin, AvailableOrderMixin {
  AvailableOrders$Query$Order();

  factory AvailableOrders$Query$Order.fromJson(Map<String, dynamic> json) =>
      _$AvailableOrders$Query$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        currency,
        costBest,
        addresses,
        distanceBest,
        durationBest,
        directions,
        options,
        service,
        points
      ];
  @override
  Map<String, dynamic> toJson() => _$AvailableOrders$Query$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AvailableOrders$Query extends JsonSerializable with EquatableMixin {
  AvailableOrders$Query();

  factory AvailableOrders$Query.fromJson(Map<String, dynamic> json) =>
      _$AvailableOrders$QueryFromJson(json);

  late List<AvailableOrders$Query$Order> availableOrders;

  @override
  List<Object?> get props => [availableOrders];
  @override
  Map<String, dynamic> toJson() => _$AvailableOrders$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AvailableOrderMixin$Point extends JsonSerializable
    with EquatableMixin, PointMixin {
  AvailableOrderMixin$Point();

  factory AvailableOrderMixin$Point.fromJson(Map<String, dynamic> json) =>
      _$AvailableOrderMixin$PointFromJson(json);

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() => _$AvailableOrderMixin$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AvailableOrderMixin$ServiceOption extends JsonSerializable
    with EquatableMixin {
  AvailableOrderMixin$ServiceOption();

  factory AvailableOrderMixin$ServiceOption.fromJson(
          Map<String, dynamic> json) =>
      _$AvailableOrderMixin$ServiceOptionFromJson(json);

  late String name;

  @JsonKey(unknownEnumValue: ServiceOptionIcon.artemisUnknown)
  late ServiceOptionIcon icon;

  @override
  List<Object?> get props => [name, icon];
  @override
  Map<String, dynamic> toJson() =>
      _$AvailableOrderMixin$ServiceOptionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AvailableOrderMixin$Service extends JsonSerializable with EquatableMixin {
  AvailableOrderMixin$Service();

  factory AvailableOrderMixin$Service.fromJson(Map<String, dynamic> json) =>
      _$AvailableOrderMixin$ServiceFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() => _$AvailableOrderMixin$ServiceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OrderCreated$Subscription$Order extends JsonSerializable
    with EquatableMixin, AvailableOrderMixin {
  OrderCreated$Subscription$Order();

  factory OrderCreated$Subscription$Order.fromJson(Map<String, dynamic> json) =>
      _$OrderCreated$Subscription$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        currency,
        costBest,
        addresses,
        distanceBest,
        durationBest,
        directions,
        options,
        service,
        points
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$OrderCreated$Subscription$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OrderCreated$Subscription extends JsonSerializable with EquatableMixin {
  OrderCreated$Subscription();

  factory OrderCreated$Subscription.fromJson(Map<String, dynamic> json) =>
      _$OrderCreated$SubscriptionFromJson(json);

  late OrderCreated$Subscription$Order orderCreated;

  @override
  List<Object?> get props => [orderCreated];
  @override
  Map<String, dynamic> toJson() => _$OrderCreated$SubscriptionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OrderRemoved$Subscription$Order extends JsonSerializable
    with EquatableMixin {
  OrderRemoved$Subscription$Order();

  factory OrderRemoved$Subscription$Order.fromJson(Map<String, dynamic> json) =>
      _$OrderRemoved$Subscription$OrderFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$OrderRemoved$Subscription$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OrderRemoved$Subscription extends JsonSerializable with EquatableMixin {
  OrderRemoved$Subscription();

  factory OrderRemoved$Subscription.fromJson(Map<String, dynamic> json) =>
      _$OrderRemoved$SubscriptionFromJson(json);

  late OrderRemoved$Subscription$Order orderRemoved;

  @override
  List<Object?> get props => [orderRemoved];
  @override
  Map<String, dynamic> toJson() => _$OrderRemoved$SubscriptionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OrderUpdated$Subscription$Order extends JsonSerializable
    with EquatableMixin {
  OrderUpdated$Subscription$Order();

  factory OrderUpdated$Subscription$Order.fromJson(Map<String, dynamic> json) =>
      _$OrderUpdated$Subscription$OrderFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$OrderUpdated$Subscription$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class OrderUpdated$Subscription extends JsonSerializable with EquatableMixin {
  OrderUpdated$Subscription();

  factory OrderUpdated$Subscription.fromJson(Map<String, dynamic> json) =>
      _$OrderUpdated$SubscriptionFromJson(json);

  late OrderUpdated$Subscription$Order orderUpdated;

  @override
  List<Object?> get props => [orderUpdated];
  @override
  Map<String, dynamic> toJson() => _$OrderUpdated$SubscriptionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverLocation$Mutation$Order extends JsonSerializable
    with EquatableMixin, AvailableOrderMixin {
  UpdateDriverLocation$Mutation$Order();

  factory UpdateDriverLocation$Mutation$Order.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDriverLocation$Mutation$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        currency,
        costBest,
        addresses,
        distanceBest,
        durationBest,
        directions,
        options,
        service,
        points
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateDriverLocation$Mutation$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverLocation$Mutation extends JsonSerializable
    with EquatableMixin {
  UpdateDriverLocation$Mutation();

  factory UpdateDriverLocation$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateDriverLocation$MutationFromJson(json);

  late List<UpdateDriverLocation$Mutation$Order> updateDriversLocationNew;

  @override
  List<Object?> get props => [updateDriversLocationNew];
  @override
  Map<String, dynamic> toJson() => _$UpdateDriverLocation$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PointInput extends JsonSerializable with EquatableMixin {
  PointInput({
    required this.lat,
    required this.lng,
  });

  factory PointInput.fromJson(Map<String, dynamic> json) =>
      _$PointInputFromJson(json);

  late double lat;

  late double lng;

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() => _$PointInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateOrderStatus$Mutation$Order extends JsonSerializable
    with EquatableMixin, CurrentOrderMixin {
  UpdateOrderStatus$Mutation$Order();

  factory UpdateOrderStatus$Mutation$Order.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateOrderStatus$Mutation$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        createdOn,
        expectedTimestamp,
        status,
        currency,
        costBest,
        costAfterCoupon,
        paidAmount,
        etaPickup,
        tipAmount,
        directions,
        points,
        service,
        options,
        addresses,
        passenger
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateOrderStatus$Mutation$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateOrderStatus$Mutation extends JsonSerializable with EquatableMixin {
  UpdateOrderStatus$Mutation();

  factory UpdateOrderStatus$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrderStatus$MutationFromJson(json);

  late UpdateOrderStatus$Mutation$Order updateOneOrder;

  @override
  List<Object?> get props => [updateOneOrder];
  @override
  Map<String, dynamic> toJson() => _$UpdateOrderStatus$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverStatus$Mutation$Driver extends JsonSerializable
    with EquatableMixin, BasicProfileMixin {
  UpdateDriverStatus$Mutation$Driver();

  factory UpdateDriverStatus$Mutation$Driver.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDriverStatus$Mutation$DriverFromJson(json);

  @override
  List<Object?> get props => [
        mobileNumber,
        firstName,
        lastName,
        searchDistance,
        media,
        softRejectionNote,
        status,
        currentOrders,
        wallets
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateDriverStatus$Mutation$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverStatus$Mutation extends JsonSerializable with EquatableMixin {
  UpdateDriverStatus$Mutation();

  factory UpdateDriverStatus$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateDriverStatus$MutationFromJson(json);

  late UpdateDriverStatus$Mutation$Driver updateOneDriver;

  @override
  List<Object?> get props => [updateOneDriver];
  @override
  Map<String, dynamic> toJson() => _$UpdateDriverStatus$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverFCMId$Mutation$Driver extends JsonSerializable
    with EquatableMixin {
  UpdateDriverFCMId$Mutation$Driver();

  factory UpdateDriverFCMId$Mutation$Driver.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDriverFCMId$Mutation$DriverFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateDriverFCMId$Mutation$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverFCMId$Mutation extends JsonSerializable with EquatableMixin {
  UpdateDriverFCMId$Mutation();

  factory UpdateDriverFCMId$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateDriverFCMId$MutationFromJson(json);

  late UpdateDriverFCMId$Mutation$Driver updateOneDriver;

  @override
  List<Object?> get props => [updateOneDriver];
  @override
  Map<String, dynamic> toJson() => _$UpdateDriverFCMId$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverSearchDistance$Mutation$Driver extends JsonSerializable
    with EquatableMixin {
  UpdateDriverSearchDistance$Mutation$Driver();

  factory UpdateDriverSearchDistance$Mutation$Driver.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDriverSearchDistance$Mutation$DriverFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateDriverSearchDistance$Mutation$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverSearchDistance$Mutation extends JsonSerializable
    with EquatableMixin {
  UpdateDriverSearchDistance$Mutation();

  factory UpdateDriverSearchDistance$Mutation.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDriverSearchDistance$MutationFromJson(json);

  late UpdateDriverSearchDistance$Mutation$Driver updateOneDriver;

  @override
  List<Object?> get props => [updateOneDriver];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateDriverSearchDistance$MutationToJson(this);
}

enum DriverStatus {
  @JsonValue('Online')
  online,
  @JsonValue('Offline')
  offline,
  @JsonValue('Blocked')
  blocked,
  @JsonValue('InService')
  inService,
  @JsonValue('WaitingDocuments')
  waitingDocuments,
  @JsonValue('PendingApproval')
  pendingApproval,
  @JsonValue('SoftReject')
  softReject,
  @JsonValue('HardReject')
  hardReject,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum Gender {
  @JsonValue('Male')
  male,
  @JsonValue('Female')
  female,
  @JsonValue('Unknown')
  unknown,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum OrderStatus {
  @JsonValue('Requested')
  requested,
  @JsonValue('NotFound')
  notFound,
  @JsonValue('NoCloseFound')
  noCloseFound,
  @JsonValue('Found')
  found,
  @JsonValue('DriverAccepted')
  driverAccepted,
  @JsonValue('Arrived')
  arrived,
  @JsonValue('WaitingForPrePay')
  waitingForPrePay,
  @JsonValue('DriverCanceled')
  driverCanceled,
  @JsonValue('PassengerCanceled')
  passengerCanceled,
  @JsonValue('Started')
  started,
  @JsonValue('WaitingForPostPay')
  waitingForPostPay,
  @JsonValue('WaitingForReview')
  waitingForReview,
  @JsonValue('Finished')
  finished,
  @JsonValue('Booked')
  booked,
  @JsonValue('Expired')
  expired,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum ServiceOptionIcon {
  @JsonValue('Pet')
  pet,
  @JsonValue('TwoWay')
  twoWay,
  @JsonValue('Luggage')
  luggage,
  @JsonValue('PackageDelivery')
  packageDelivery,
  @JsonValue('Shopping')
  shopping,
  @JsonValue('Custom1')
  custom1,
  @JsonValue('Custom2')
  custom2,
  @JsonValue('Custom3')
  custom3,
  @JsonValue('Custom4')
  custom4,
  @JsonValue('Custom5')
  custom5,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum VersionStatus {
  @JsonValue('Latest')
  latest,
  @JsonValue('MandatoryUpdate')
  mandatoryUpdate,
  @JsonValue('OptionalUpdate')
  optionalUpdate,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

@JsonSerializable(explicitToJson: true)
class UpdateProfileArguments extends JsonSerializable with EquatableMixin {
  UpdateProfileArguments({required this.input});

  @override
  factory UpdateProfileArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileArgumentsFromJson(json);

  late UpdateDriverInput input;

  @override
  List<Object?> get props => [input];
  @override
  Map<String, dynamic> toJson() => _$UpdateProfileArgumentsToJson(this);
}

final UPDATE_PROFILE_MUTATION_DOCUMENT_OPERATION_NAME = 'UpdateProfile';
final UPDATE_PROFILE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateProfile'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'UpdateDriverInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateOneDriver'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: StringValueNode(
                  value: '1',
                  isBlock: false,
                ),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'update'),
                value: VariableNode(name: NameNode(value: 'input')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class UpdateProfileMutation
    extends GraphQLQuery<UpdateProfile$Mutation, UpdateProfileArguments> {
  UpdateProfileMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_PROFILE_MUTATION_DOCUMENT;

  @override
  final String operationName = UPDATE_PROFILE_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateProfileArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateProfile$Mutation parse(Map<String, dynamic> json) =>
      UpdateProfile$Mutation.fromJson(json);
}

final GET_DRIVER_QUERY_DOCUMENT_OPERATION_NAME = 'GetDriver';
final GET_DRIVER_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetDriver'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'driver'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: StringValueNode(
              value: '1',
              isBlock: false,
            ),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'firstName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'lastName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'gender'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'email'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'mobileNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'accountNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'bankName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'bankRoutingNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'documents'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'bankSwift'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'carPlate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'carProductionYear'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'certificateNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'carColorId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'carModelId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'carModels'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'carColors'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
    ]),
  )
]);

class GetDriverQuery extends GraphQLQuery<GetDriver$Query, JsonSerializable> {
  GetDriverQuery();

  @override
  final DocumentNode document = GET_DRIVER_QUERY_DOCUMENT;

  @override
  final String operationName = GET_DRIVER_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetDriver$Query parse(Map<String, dynamic> json) =>
      GetDriver$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class LoginArguments extends JsonSerializable with EquatableMixin {
  LoginArguments({required this.firebaseToken});

  @override
  factory LoginArguments.fromJson(Map<String, dynamic> json) =>
      _$LoginArgumentsFromJson(json);

  late String firebaseToken;

  @override
  List<Object?> get props => [firebaseToken];
  @override
  Map<String, dynamic> toJson() => _$LoginArgumentsToJson(this);
}

final LOGIN_MUTATION_DOCUMENT_OPERATION_NAME = 'Login';
final LOGIN_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'Login'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'firebaseToken')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'login'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'firebaseToken'),
                value: VariableNode(name: NameNode(value: 'firebaseToken')),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'jwtToken'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class LoginMutation extends GraphQLQuery<Login$Mutation, LoginArguments> {
  LoginMutation({required this.variables});

  @override
  final DocumentNode document = LOGIN_MUTATION_DOCUMENT;

  @override
  final String operationName = LOGIN_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final LoginArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Login$Mutation parse(Map<String, dynamic> json) =>
      Login$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SetDocumentsOnDriverArguments extends JsonSerializable
    with EquatableMixin {
  SetDocumentsOnDriverArguments({
    required this.driverId,
    required this.relationIds,
  });

  @override
  factory SetDocumentsOnDriverArguments.fromJson(Map<String, dynamic> json) =>
      _$SetDocumentsOnDriverArgumentsFromJson(json);

  late String driverId;

  late List<String> relationIds;

  @override
  List<Object?> get props => [driverId, relationIds];
  @override
  Map<String, dynamic> toJson() => _$SetDocumentsOnDriverArgumentsToJson(this);
}

final SET_DOCUMENTS_ON_DRIVER_MUTATION_DOCUMENT_OPERATION_NAME =
    'SetDocumentsOnDriver';
final SET_DOCUMENTS_ON_DRIVER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SetDocumentsOnDriver'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'driverId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'relationIds')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'ID'),
            isNonNull: true,
          ),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateOneDriver'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'driverId')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'update'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'status'),
                    value:
                        EnumValueNode(name: NameNode(value: 'PendingApproval')),
                  )
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'BasicProfile'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'setDocumentsOnDriver'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'driverId')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'relationIds'),
                value: VariableNode(name: NameNode(value: 'relationIds')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'BasicProfile'),
            directives: [],
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'BasicProfile'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Driver'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'mobileNumber'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'firstName'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lastName'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'searchDistance'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'media'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'softRejectionNote'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'currentOrders'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'CurrentOrder'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'wallets'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'balance'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'currency'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'CurrentOrder'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Order'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdOn'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'expectedTimestamp'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'currency'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costAfterCoupon'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'paidAmount'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'etaPickup'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'tipAmount'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'directions'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'points'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'service'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'options'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'icon'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'addresses'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'passenger'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'mobileNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'firstName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'lastName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'Point'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Point'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'lat'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lng'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class SetDocumentsOnDriverMutation extends GraphQLQuery<
    SetDocumentsOnDriver$Mutation, SetDocumentsOnDriverArguments> {
  SetDocumentsOnDriverMutation({required this.variables});

  @override
  final DocumentNode document = SET_DOCUMENTS_ON_DRIVER_MUTATION_DOCUMENT;

  @override
  final String operationName =
      SET_DOCUMENTS_ON_DRIVER_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final SetDocumentsOnDriverArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  SetDocumentsOnDriver$Mutation parse(Map<String, dynamic> json) =>
      SetDocumentsOnDriver$Mutation.fromJson(json);
}

final DELETE_USER_MUTATION_DOCUMENT_OPERATION_NAME = 'DeleteUser';
final DELETE_USER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'DeleteUser'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'deleteUser'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class DeleteUserMutation
    extends GraphQLQuery<DeleteUser$Mutation, JsonSerializable> {
  DeleteUserMutation();

  @override
  final DocumentNode document = DELETE_USER_MUTATION_DOCUMENT;

  @override
  final String operationName = DELETE_USER_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  DeleteUser$Mutation parse(Map<String, dynamic> json) =>
      DeleteUser$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class MeArguments extends JsonSerializable with EquatableMixin {
  MeArguments({required this.versionCode});

  @override
  factory MeArguments.fromJson(Map<String, dynamic> json) =>
      _$MeArgumentsFromJson(json);

  late int versionCode;

  @override
  List<Object?> get props => [versionCode];
  @override
  Map<String, dynamic> toJson() => _$MeArgumentsToJson(this);
}

final ME_QUERY_DOCUMENT_OPERATION_NAME = 'Me';
final ME_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'Me'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'versionCode')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'driver'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'id'),
            value: IntValueNode(value: '1'),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'BasicProfile'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'requireUpdate'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'versionCode'),
            value: VariableNode(name: NameNode(value: 'versionCode')),
          )
        ],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'BasicProfile'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Driver'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'mobileNumber'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'firstName'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lastName'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'searchDistance'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'media'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'softRejectionNote'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'currentOrders'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'CurrentOrder'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'wallets'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'balance'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'currency'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'CurrentOrder'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Order'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdOn'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'expectedTimestamp'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'currency'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costAfterCoupon'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'paidAmount'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'etaPickup'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'tipAmount'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'directions'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'points'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'service'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'options'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'icon'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'addresses'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'passenger'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'mobileNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'firstName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'lastName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'Point'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Point'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'lat'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lng'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class MeQuery extends GraphQLQuery<Me$Query, MeArguments> {
  MeQuery({required this.variables});

  @override
  final DocumentNode document = ME_QUERY_DOCUMENT;

  @override
  final String operationName = ME_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final MeArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Me$Query parse(Map<String, dynamic> json) => Me$Query.fromJson(json);
}

final AVAILABLE_ORDERS_QUERY_DOCUMENT_OPERATION_NAME = 'AvailableOrders';
final AVAILABLE_ORDERS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'AvailableOrders'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'availableOrders'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'AvailableOrder'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'AvailableOrder'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Order'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'currency'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'addresses'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'distanceBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'durationBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'directions'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'options'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'icon'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'service'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'points'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'Point'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Point'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'lat'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lng'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class AvailableOrdersQuery
    extends GraphQLQuery<AvailableOrders$Query, JsonSerializable> {
  AvailableOrdersQuery();

  @override
  final DocumentNode document = AVAILABLE_ORDERS_QUERY_DOCUMENT;

  @override
  final String operationName = AVAILABLE_ORDERS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  AvailableOrders$Query parse(Map<String, dynamic> json) =>
      AvailableOrders$Query.fromJson(json);
}

final ORDER_CREATED_SUBSCRIPTION_DOCUMENT_OPERATION_NAME = 'OrderCreated';
final ORDER_CREATED_SUBSCRIPTION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'OrderCreated'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'orderCreated'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'AvailableOrder'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'AvailableOrder'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Order'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'currency'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'addresses'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'distanceBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'durationBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'directions'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'options'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'icon'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'service'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'points'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'Point'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Point'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'lat'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lng'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class OrderCreatedSubscription
    extends GraphQLQuery<OrderCreated$Subscription, JsonSerializable> {
  OrderCreatedSubscription();

  @override
  final DocumentNode document = ORDER_CREATED_SUBSCRIPTION_DOCUMENT;

  @override
  final String operationName =
      ORDER_CREATED_SUBSCRIPTION_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  OrderCreated$Subscription parse(Map<String, dynamic> json) =>
      OrderCreated$Subscription.fromJson(json);
}

final ORDER_REMOVED_SUBSCRIPTION_DOCUMENT_OPERATION_NAME = 'OrderRemoved';
final ORDER_REMOVED_SUBSCRIPTION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'OrderRemoved'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'orderRemoved'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class OrderRemovedSubscription
    extends GraphQLQuery<OrderRemoved$Subscription, JsonSerializable> {
  OrderRemovedSubscription();

  @override
  final DocumentNode document = ORDER_REMOVED_SUBSCRIPTION_DOCUMENT;

  @override
  final String operationName =
      ORDER_REMOVED_SUBSCRIPTION_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  OrderRemoved$Subscription parse(Map<String, dynamic> json) =>
      OrderRemoved$Subscription.fromJson(json);
}

final ORDER_UPDATED_SUBSCRIPTION_DOCUMENT_OPERATION_NAME = 'OrderUpdated';
final ORDER_UPDATED_SUBSCRIPTION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'OrderUpdated'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'orderUpdated'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class OrderUpdatedSubscription
    extends GraphQLQuery<OrderUpdated$Subscription, JsonSerializable> {
  OrderUpdatedSubscription();

  @override
  final DocumentNode document = ORDER_UPDATED_SUBSCRIPTION_DOCUMENT;

  @override
  final String operationName =
      ORDER_UPDATED_SUBSCRIPTION_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  OrderUpdated$Subscription parse(Map<String, dynamic> json) =>
      OrderUpdated$Subscription.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverLocationArguments extends JsonSerializable
    with EquatableMixin {
  UpdateDriverLocationArguments({required this.point});

  @override
  factory UpdateDriverLocationArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateDriverLocationArgumentsFromJson(json);

  late PointInput point;

  @override
  List<Object?> get props => [point];
  @override
  Map<String, dynamic> toJson() => _$UpdateDriverLocationArgumentsToJson(this);
}

final UPDATE_DRIVER_LOCATION_MUTATION_DOCUMENT_OPERATION_NAME =
    'UpdateDriverLocation';
final UPDATE_DRIVER_LOCATION_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateDriverLocation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'point')),
        type: NamedTypeNode(
          name: NameNode(value: 'PointInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateDriversLocationNew'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'point'),
            value: VariableNode(name: NameNode(value: 'point')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'AvailableOrder'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'AvailableOrder'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Order'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'currency'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'addresses'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'distanceBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'durationBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'directions'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'options'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'icon'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'service'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'points'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'Point'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Point'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'lat'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lng'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class UpdateDriverLocationMutation extends GraphQLQuery<
    UpdateDriverLocation$Mutation, UpdateDriverLocationArguments> {
  UpdateDriverLocationMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_DRIVER_LOCATION_MUTATION_DOCUMENT;

  @override
  final String operationName =
      UPDATE_DRIVER_LOCATION_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateDriverLocationArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateDriverLocation$Mutation parse(Map<String, dynamic> json) =>
      UpdateDriverLocation$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateOrderStatusArguments extends JsonSerializable with EquatableMixin {
  UpdateOrderStatusArguments({
    required this.orderId,
    required this.status,
    this.cashPayment,
  });

  @override
  factory UpdateOrderStatusArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrderStatusArgumentsFromJson(json);

  late String orderId;

  @JsonKey(unknownEnumValue: OrderStatus.artemisUnknown)
  late OrderStatus status;

  final double? cashPayment;

  @override
  List<Object?> get props => [orderId, status, cashPayment];
  @override
  Map<String, dynamic> toJson() => _$UpdateOrderStatusArgumentsToJson(this);
}

final UPDATE_ORDER_STATUS_MUTATION_DOCUMENT_OPERATION_NAME =
    'UpdateOrderStatus';
final UPDATE_ORDER_STATUS_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateOrderStatus'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'orderId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'status')),
        type: NamedTypeNode(
          name: NameNode(value: 'OrderStatus'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'cashPayment')),
        type: NamedTypeNode(
          name: NameNode(value: 'Float'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateOneOrder'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: VariableNode(name: NameNode(value: 'orderId')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'update'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'status'),
                    value: VariableNode(name: NameNode(value: 'status')),
                  ),
                  ObjectFieldNode(
                    name: NameNode(value: 'paidAmount'),
                    value: VariableNode(name: NameNode(value: 'cashPayment')),
                  ),
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'CurrentOrder'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'CurrentOrder'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Order'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdOn'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'expectedTimestamp'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'currency'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costAfterCoupon'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'paidAmount'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'etaPickup'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'tipAmount'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'directions'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'points'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'service'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'options'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'icon'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'addresses'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'passenger'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'mobileNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'firstName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'lastName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'Point'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Point'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'lat'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lng'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class UpdateOrderStatusMutation extends GraphQLQuery<UpdateOrderStatus$Mutation,
    UpdateOrderStatusArguments> {
  UpdateOrderStatusMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_ORDER_STATUS_MUTATION_DOCUMENT;

  @override
  final String operationName =
      UPDATE_ORDER_STATUS_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateOrderStatusArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateOrderStatus$Mutation parse(Map<String, dynamic> json) =>
      UpdateOrderStatus$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverStatusArguments extends JsonSerializable with EquatableMixin {
  UpdateDriverStatusArguments({
    required this.status,
    this.fcmId,
  });

  @override
  factory UpdateDriverStatusArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateDriverStatusArgumentsFromJson(json);

  @JsonKey(unknownEnumValue: DriverStatus.artemisUnknown)
  late DriverStatus status;

  final String? fcmId;

  @override
  List<Object?> get props => [status, fcmId];
  @override
  Map<String, dynamic> toJson() => _$UpdateDriverStatusArgumentsToJson(this);
}

final UPDATE_DRIVER_STATUS_MUTATION_DOCUMENT_OPERATION_NAME =
    'UpdateDriverStatus';
final UPDATE_DRIVER_STATUS_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateDriverStatus'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'status')),
        type: NamedTypeNode(
          name: NameNode(value: 'DriverStatus'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'fcmId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateOneDriver'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: StringValueNode(
                  value: '1',
                  isBlock: false,
                ),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'update'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'status'),
                    value: VariableNode(name: NameNode(value: 'status')),
                  ),
                  ObjectFieldNode(
                    name: NameNode(value: 'notificationPlayerId'),
                    value: VariableNode(name: NameNode(value: 'fcmId')),
                  ),
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'BasicProfile'),
            directives: [],
          )
        ]),
      )
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'BasicProfile'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Driver'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'mobileNumber'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'firstName'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lastName'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'searchDistance'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'media'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'address'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'softRejectionNote'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'currentOrders'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'CurrentOrder'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'wallets'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'balance'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'currency'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'CurrentOrder'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Order'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'id'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'createdOn'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'expectedTimestamp'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'currency'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costBest'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'costAfterCoupon'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'paidAmount'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'etaPickup'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'tipAmount'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'directions'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'points'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'service'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'options'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'icon'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'addresses'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'passenger'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'mobileNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'firstName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'lastName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'media'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'address'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
        ]),
      ),
    ]),
  ),
  FragmentDefinitionNode(
    name: NameNode(value: 'Point'),
    typeCondition: TypeConditionNode(
        on: NamedTypeNode(
      name: NameNode(value: 'Point'),
      isNonNull: false,
    )),
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'lat'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'lng'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);

class UpdateDriverStatusMutation extends GraphQLQuery<
    UpdateDriverStatus$Mutation, UpdateDriverStatusArguments> {
  UpdateDriverStatusMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_DRIVER_STATUS_MUTATION_DOCUMENT;

  @override
  final String operationName =
      UPDATE_DRIVER_STATUS_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateDriverStatusArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateDriverStatus$Mutation parse(Map<String, dynamic> json) =>
      UpdateDriverStatus$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverFCMIdArguments extends JsonSerializable with EquatableMixin {
  UpdateDriverFCMIdArguments({this.fcmId});

  @override
  factory UpdateDriverFCMIdArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateDriverFCMIdArgumentsFromJson(json);

  final String? fcmId;

  @override
  List<Object?> get props => [fcmId];
  @override
  Map<String, dynamic> toJson() => _$UpdateDriverFCMIdArgumentsToJson(this);
}

final UPDATE_DRIVER_F_C_M_ID_MUTATION_DOCUMENT_OPERATION_NAME =
    'UpdateDriverFCMId';
final UPDATE_DRIVER_F_C_M_ID_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateDriverFCMId'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'fcmId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateOneDriver'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: StringValueNode(
                  value: '1',
                  isBlock: false,
                ),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'update'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'notificationPlayerId'),
                    value: VariableNode(name: NameNode(value: 'fcmId')),
                  )
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class UpdateDriverFCMIdMutation extends GraphQLQuery<UpdateDriverFCMId$Mutation,
    UpdateDriverFCMIdArguments> {
  UpdateDriverFCMIdMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_DRIVER_F_C_M_ID_MUTATION_DOCUMENT;

  @override
  final String operationName =
      UPDATE_DRIVER_F_C_M_ID_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateDriverFCMIdArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateDriverFCMId$Mutation parse(Map<String, dynamic> json) =>
      UpdateDriverFCMId$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateDriverSearchDistanceArguments extends JsonSerializable
    with EquatableMixin {
  UpdateDriverSearchDistanceArguments({required this.distance});

  @override
  factory UpdateDriverSearchDistanceArguments.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDriverSearchDistanceArgumentsFromJson(json);

  late int distance;

  @override
  List<Object?> get props => [distance];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateDriverSearchDistanceArgumentsToJson(this);
}

final UPDATE_DRIVER_SEARCH_DISTANCE_MUTATION_DOCUMENT_OPERATION_NAME =
    'UpdateDriverSearchDistance';
final UPDATE_DRIVER_SEARCH_DISTANCE_MUTATION_DOCUMENT =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdateDriverSearchDistance'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'distance')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateOneDriver'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'id'),
                value: StringValueNode(
                  value: '1',
                  isBlock: false,
                ),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'update'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'searchDistance'),
                    value: VariableNode(name: NameNode(value: 'distance')),
                  )
                ]),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class UpdateDriverSearchDistanceMutation extends GraphQLQuery<
    UpdateDriverSearchDistance$Mutation, UpdateDriverSearchDistanceArguments> {
  UpdateDriverSearchDistanceMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_DRIVER_SEARCH_DISTANCE_MUTATION_DOCUMENT;

  @override
  final String operationName =
      UPDATE_DRIVER_SEARCH_DISTANCE_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateDriverSearchDistanceArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateDriverSearchDistance$Mutation parse(Map<String, dynamic> json) =>
      UpdateDriverSearchDistance$Mutation.fromJson(json);
}
