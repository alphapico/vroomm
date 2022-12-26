// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import '../scalars/timestamp.dart';
import '../scalars/connection_cursor.dart';
part 'graphql_api.graphql.g.dart';

mixin CurrentOrderMixin {
  late String id;
  @JsonKey(unknownEnumValue: OrderStatus.artemisUnknown)
  late OrderStatus status;
  late List<CurrentOrderMixin$Point> points;
  CurrentOrderMixin$Driver? driver;
  late CurrentOrderMixin$Service service;
  List<CurrentOrderMixin$Point>? directions;
  @JsonKey(
      fromJson: fromGraphQLTimestampNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLTimestampNullable)
  DateTime? etaPickup;
  late double paidAmount;
  late double costAfterCoupon;
  late double costBest;
  late String currency;
  late List<String> addresses;
  late int waitMinutes;
  @JsonKey(
      fromJson: fromGraphQLTimestampNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLTimestampNullable)
  DateTime? startTimestamp;
  late int durationBest;
}
mixin PointMixin {
  late double lat;
  late double lng;
}

@JsonSerializable(explicitToJson: true)
class GetCurrentOrder$Query$Passenger$Media extends JsonSerializable
    with EquatableMixin {
  GetCurrentOrder$Query$Passenger$Media();

  factory GetCurrentOrder$Query$Passenger$Media.fromJson(
          Map<String, dynamic> json) =>
      _$GetCurrentOrder$Query$Passenger$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$GetCurrentOrder$Query$Passenger$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentOrder$Query$Passenger$Order extends JsonSerializable
    with EquatableMixin, CurrentOrderMixin {
  GetCurrentOrder$Query$Passenger$Order();

  factory GetCurrentOrder$Query$Passenger$Order.fromJson(
          Map<String, dynamic> json) =>
      _$GetCurrentOrder$Query$Passenger$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        points,
        driver,
        service,
        directions,
        etaPickup,
        paidAmount,
        costAfterCoupon,
        costBest,
        currency,
        addresses,
        waitMinutes,
        startTimestamp,
        durationBest
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetCurrentOrder$Query$Passenger$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentOrder$Query$Passenger$BookedOrders$PassengerOrdersCountAggregate
    extends JsonSerializable with EquatableMixin {
  GetCurrentOrder$Query$Passenger$BookedOrders$PassengerOrdersCountAggregate();

  factory GetCurrentOrder$Query$Passenger$BookedOrders$PassengerOrdersCountAggregate.fromJson(
          Map<String, dynamic> json) =>
      _$GetCurrentOrder$Query$Passenger$BookedOrders$PassengerOrdersCountAggregateFromJson(
          json);

  int? id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$GetCurrentOrder$Query$Passenger$BookedOrders$PassengerOrdersCountAggregateToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentOrder$Query$Passenger$BookedOrders extends JsonSerializable
    with EquatableMixin {
  GetCurrentOrder$Query$Passenger$BookedOrders();

  factory GetCurrentOrder$Query$Passenger$BookedOrders.fromJson(
          Map<String, dynamic> json) =>
      _$GetCurrentOrder$Query$Passenger$BookedOrdersFromJson(json);

  GetCurrentOrder$Query$Passenger$BookedOrders$PassengerOrdersCountAggregate?
      count;

  @override
  List<Object?> get props => [count];
  @override
  Map<String, dynamic> toJson() =>
      _$GetCurrentOrder$Query$Passenger$BookedOrdersToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentOrder$Query$Passenger extends JsonSerializable
    with EquatableMixin {
  GetCurrentOrder$Query$Passenger();

  factory GetCurrentOrder$Query$Passenger.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentOrder$Query$PassengerFromJson(json);

  late String id;

  late String mobileNumber;

  String? firstName;

  String? lastName;

  @JsonKey(unknownEnumValue: Gender.artemisUnknown)
  Gender? gender;

  String? email;

  GetCurrentOrder$Query$Passenger$Media? media;

  late List<GetCurrentOrder$Query$Passenger$Order> orders;

  late List<GetCurrentOrder$Query$Passenger$BookedOrders> bookedOrders;

  @override
  List<Object?> get props => [
        id,
        mobileNumber,
        firstName,
        lastName,
        gender,
        email,
        media,
        orders,
        bookedOrders
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetCurrentOrder$Query$PassengerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentOrder$Query$Point extends JsonSerializable
    with EquatableMixin, PointMixin {
  GetCurrentOrder$Query$Point();

  factory GetCurrentOrder$Query$Point.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentOrder$Query$PointFromJson(json);

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() => _$GetCurrentOrder$Query$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCurrentOrder$Query extends JsonSerializable with EquatableMixin {
  GetCurrentOrder$Query();

  factory GetCurrentOrder$Query.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentOrder$QueryFromJson(json);

  GetCurrentOrder$Query$Passenger? passenger;

  @JsonKey(unknownEnumValue: VersionStatus.artemisUnknown)
  late VersionStatus requireUpdate;

  GetCurrentOrder$Query$Point? getCurrentOrderDriverLocation;

  @override
  List<Object?> get props =>
      [passenger, requireUpdate, getCurrentOrderDriverLocation];
  @override
  Map<String, dynamic> toJson() => _$GetCurrentOrder$QueryToJson(this);
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
class CurrentOrderMixin$Driver$Media extends JsonSerializable
    with EquatableMixin {
  CurrentOrderMixin$Driver$Media();

  factory CurrentOrderMixin$Driver$Media.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$Driver$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() => _$CurrentOrderMixin$Driver$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Driver$CarModel extends JsonSerializable
    with EquatableMixin {
  CurrentOrderMixin$Driver$CarModel();

  factory CurrentOrderMixin$Driver$CarModel.fromJson(
          Map<String, dynamic> json) =>
      _$CurrentOrderMixin$Driver$CarModelFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() =>
      _$CurrentOrderMixin$Driver$CarModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Driver$CarColor extends JsonSerializable
    with EquatableMixin {
  CurrentOrderMixin$Driver$CarColor();

  factory CurrentOrderMixin$Driver$CarColor.fromJson(
          Map<String, dynamic> json) =>
      _$CurrentOrderMixin$Driver$CarColorFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() =>
      _$CurrentOrderMixin$Driver$CarColorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Driver extends JsonSerializable with EquatableMixin {
  CurrentOrderMixin$Driver();

  factory CurrentOrderMixin$Driver.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$DriverFromJson(json);

  String? firstName;

  String? lastName;

  CurrentOrderMixin$Driver$Media? media;

  late String mobileNumber;

  String? carPlate;

  CurrentOrderMixin$Driver$CarModel? car;

  CurrentOrderMixin$Driver$CarColor? carColor;

  int? rating;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        media,
        mobileNumber,
        carPlate,
        car,
        carColor,
        rating
      ];
  @override
  Map<String, dynamic> toJson() => _$CurrentOrderMixin$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Service$Media extends JsonSerializable
    with EquatableMixin {
  CurrentOrderMixin$Service$Media();

  factory CurrentOrderMixin$Service$Media.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$Service$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$CurrentOrderMixin$Service$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentOrderMixin$Service extends JsonSerializable with EquatableMixin {
  CurrentOrderMixin$Service();

  factory CurrentOrderMixin$Service.fromJson(Map<String, dynamic> json) =>
      _$CurrentOrderMixin$ServiceFromJson(json);

  late CurrentOrderMixin$Service$Media media;

  late String name;

  late double cancellationTotalFee;

  @override
  List<Object?> get props => [media, name, cancellationTotalFee];
  @override
  Map<String, dynamic> toJson() => _$CurrentOrderMixin$ServiceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateOrder$Mutation$Order extends JsonSerializable
    with EquatableMixin, CurrentOrderMixin {
  CreateOrder$Mutation$Order();

  factory CreateOrder$Mutation$Order.fromJson(Map<String, dynamic> json) =>
      _$CreateOrder$Mutation$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        points,
        driver,
        service,
        directions,
        etaPickup,
        paidAmount,
        costAfterCoupon,
        costBest,
        currency,
        addresses,
        waitMinutes,
        startTimestamp,
        durationBest
      ];
  @override
  Map<String, dynamic> toJson() => _$CreateOrder$Mutation$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateOrder$Mutation$Passenger extends JsonSerializable
    with EquatableMixin {
  CreateOrder$Mutation$Passenger();

  factory CreateOrder$Mutation$Passenger.fromJson(Map<String, dynamic> json) =>
      _$CreateOrder$Mutation$PassengerFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$CreateOrder$Mutation$PassengerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateOrder$Mutation extends JsonSerializable with EquatableMixin {
  CreateOrder$Mutation();

  factory CreateOrder$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CreateOrder$MutationFromJson(json);

  late CreateOrder$Mutation$Order createOrder;

  late CreateOrder$Mutation$Passenger updateOnePassenger;

  @override
  List<Object?> get props => [createOrder, updateOnePassenger];
  @override
  Map<String, dynamic> toJson() => _$CreateOrder$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CreateOrderInput extends JsonSerializable with EquatableMixin {
  CreateOrderInput({
    required this.serviceId,
    required this.points,
    required this.addresses,
    required this.intervalMinutes,
    this.twoWay,
    this.optionIds,
    this.couponCode,
  });

  factory CreateOrderInput.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderInputFromJson(json);

  late int serviceId;

  late List<PointInput> points;

  late List<String> addresses;

  late int intervalMinutes;

  bool? twoWay;

  List<String>? optionIds;

  String? couponCode;

  @override
  List<Object?> get props => [
        serviceId,
        points,
        addresses,
        intervalMinutes,
        twoWay,
        optionIds,
        couponCode
      ];
  @override
  Map<String, dynamic> toJson() => _$CreateOrderInputToJson(this);
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
class CancelOrder$Mutation$Order extends JsonSerializable
    with EquatableMixin, CurrentOrderMixin {
  CancelOrder$Mutation$Order();

  factory CancelOrder$Mutation$Order.fromJson(Map<String, dynamic> json) =>
      _$CancelOrder$Mutation$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        points,
        driver,
        service,
        directions,
        etaPickup,
        paidAmount,
        costAfterCoupon,
        costBest,
        currency,
        addresses,
        waitMinutes,
        startTimestamp,
        durationBest
      ];
  @override
  Map<String, dynamic> toJson() => _$CancelOrder$Mutation$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CancelOrder$Mutation extends JsonSerializable with EquatableMixin {
  CancelOrder$Mutation();

  factory CancelOrder$Mutation.fromJson(Map<String, dynamic> json) =>
      _$CancelOrder$MutationFromJson(json);

  late CancelOrder$Mutation$Order cancelOrder;

  @override
  List<Object?> get props => [cancelOrder];
  @override
  Map<String, dynamic> toJson() => _$CancelOrder$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateOrder$Mutation$Order extends JsonSerializable
    with EquatableMixin, CurrentOrderMixin {
  UpdateOrder$Mutation$Order();

  factory UpdateOrder$Mutation$Order.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrder$Mutation$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        points,
        driver,
        service,
        directions,
        etaPickup,
        paidAmount,
        costAfterCoupon,
        costBest,
        currency,
        addresses,
        waitMinutes,
        startTimestamp,
        durationBest
      ];
  @override
  Map<String, dynamic> toJson() => _$UpdateOrder$Mutation$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateOrder$Mutation extends JsonSerializable with EquatableMixin {
  UpdateOrder$Mutation();

  factory UpdateOrder$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrder$MutationFromJson(json);

  late UpdateOrder$Mutation$Order updateOneOrder;

  @override
  List<Object?> get props => [updateOneOrder];
  @override
  Map<String, dynamic> toJson() => _$UpdateOrder$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateOrderInput extends JsonSerializable with EquatableMixin {
  UpdateOrderInput({
    this.status,
    this.tipAmount,
    this.waitMinutes,
    this.couponCode,
  });

  factory UpdateOrderInput.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrderInputFromJson(json);

  @JsonKey(unknownEnumValue: OrderStatus.artemisUnknown)
  OrderStatus? status;

  double? tipAmount;

  int? waitMinutes;

  String? couponCode;

  @override
  List<Object?> get props => [status, tipAmount, waitMinutes, couponCode];
  @override
  Map<String, dynamic> toJson() => _$UpdateOrderInputToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order$Point extends JsonSerializable
    with EquatableMixin, PointMixin {
  UpdatedOrder$Subscription$Order$Point();

  factory UpdatedOrder$Subscription$Order$Point.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$Order$PointFromJson(json);

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$Order$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order$Driver$Media extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order$Driver$Media();

  factory UpdatedOrder$Subscription$Order$Driver$Media.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$Order$Driver$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$Order$Driver$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order$Driver$CarModel extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order$Driver$CarModel();

  factory UpdatedOrder$Subscription$Order$Driver$CarModel.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$Order$Driver$CarModelFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$Order$Driver$CarModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order$Driver$CarColor extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order$Driver$CarColor();

  factory UpdatedOrder$Subscription$Order$Driver$CarColor.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$Order$Driver$CarColorFromJson(json);

  late String name;

  @override
  List<Object?> get props => [name];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$Order$Driver$CarColorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order$Driver extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order$Driver();

  factory UpdatedOrder$Subscription$Order$Driver.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$Order$DriverFromJson(json);

  String? firstName;

  String? lastName;

  UpdatedOrder$Subscription$Order$Driver$Media? media;

  late String mobileNumber;

  String? carPlate;

  UpdatedOrder$Subscription$Order$Driver$CarModel? car;

  UpdatedOrder$Subscription$Order$Driver$CarColor? carColor;

  int? rating;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        media,
        mobileNumber,
        carPlate,
        car,
        carColor,
        rating
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$Order$DriverToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order$Service$Media extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order$Service$Media();

  factory UpdatedOrder$Subscription$Order$Service$Media.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$Order$Service$MediaFromJson(json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$Order$Service$MediaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order$Service extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order$Service();

  factory UpdatedOrder$Subscription$Order$Service.fromJson(
          Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$Order$ServiceFromJson(json);

  late UpdatedOrder$Subscription$Order$Service$Media media;

  late String name;

  late double cancellationTotalFee;

  @override
  List<Object?> get props => [media, name, cancellationTotalFee];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$Order$ServiceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription$Order extends JsonSerializable
    with EquatableMixin {
  UpdatedOrder$Subscription$Order();

  factory UpdatedOrder$Subscription$Order.fromJson(Map<String, dynamic> json) =>
      _$UpdatedOrder$Subscription$OrderFromJson(json);

  late String id;

  @JsonKey(unknownEnumValue: OrderStatus.artemisUnknown)
  late OrderStatus status;

  late List<UpdatedOrder$Subscription$Order$Point> points;

  UpdatedOrder$Subscription$Order$Driver? driver;

  List<UpdatedOrder$Subscription$Order$Point>? directions;

  late UpdatedOrder$Subscription$Order$Service service;

  @JsonKey(
      fromJson: fromGraphQLTimestampNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLTimestampNullable)
  DateTime? etaPickup;

  late double paidAmount;

  late double costAfterCoupon;

  late int durationBest;

  @JsonKey(
      fromJson: fromGraphQLTimestampNullableToDartDateTimeNullable,
      toJson: fromDartDateTimeNullableToGraphQLTimestampNullable)
  DateTime? startTimestamp;

  late double costBest;

  late String currency;

  late List<String> addresses;

  late int waitMinutes;

  @override
  List<Object?> get props => [
        id,
        status,
        points,
        driver,
        directions,
        service,
        etaPickup,
        paidAmount,
        costAfterCoupon,
        durationBest,
        startTimestamp,
        costBest,
        currency,
        addresses,
        waitMinutes
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdatedOrder$Subscription$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdatedOrder$Subscription extends JsonSerializable with EquatableMixin {
  UpdatedOrder$Subscription();

  factory UpdatedOrder$Subscription.fromJson(Map<String, dynamic> json) =>
      _$UpdatedOrder$SubscriptionFromJson(json);

  late UpdatedOrder$Subscription$Order orderUpdated;

  @override
  List<Object?> get props => [orderUpdated];
  @override
  Map<String, dynamic> toJson() => _$UpdatedOrder$SubscriptionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DriverLocationUpdated$Subscription$Point extends JsonSerializable
    with EquatableMixin, PointMixin {
  DriverLocationUpdated$Subscription$Point();

  factory DriverLocationUpdated$Subscription$Point.fromJson(
          Map<String, dynamic> json) =>
      _$DriverLocationUpdated$Subscription$PointFromJson(json);

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() =>
      _$DriverLocationUpdated$Subscription$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class DriverLocationUpdated$Subscription extends JsonSerializable
    with EquatableMixin {
  DriverLocationUpdated$Subscription();

  factory DriverLocationUpdated$Subscription.fromJson(
          Map<String, dynamic> json) =>
      _$DriverLocationUpdated$SubscriptionFromJson(json);

  late DriverLocationUpdated$Subscription$Point driverLocationUpdated;

  @override
  List<Object?> get props => [driverLocationUpdated];
  @override
  Map<String, dynamic> toJson() =>
      _$DriverLocationUpdated$SubscriptionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubmitFeedback$Mutation$Order extends JsonSerializable
    with EquatableMixin, CurrentOrderMixin {
  SubmitFeedback$Mutation$Order();

  factory SubmitFeedback$Mutation$Order.fromJson(Map<String, dynamic> json) =>
      _$SubmitFeedback$Mutation$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        points,
        driver,
        service,
        directions,
        etaPickup,
        paidAmount,
        costAfterCoupon,
        costBest,
        currency,
        addresses,
        waitMinutes,
        startTimestamp,
        durationBest
      ];
  @override
  Map<String, dynamic> toJson() => _$SubmitFeedback$Mutation$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SubmitFeedback$Mutation extends JsonSerializable with EquatableMixin {
  SubmitFeedback$Mutation();

  factory SubmitFeedback$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SubmitFeedback$MutationFromJson(json);

  late SubmitFeedback$Mutation$Order submitReview;

  @override
  List<Object?> get props => [submitReview];
  @override
  Map<String, dynamic> toJson() => _$SubmitFeedback$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDriversLocation$Query$Point extends JsonSerializable
    with EquatableMixin, PointMixin {
  GetDriversLocation$Query$Point();

  factory GetDriversLocation$Query$Point.fromJson(Map<String, dynamic> json) =>
      _$GetDriversLocation$Query$PointFromJson(json);

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() => _$GetDriversLocation$Query$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetDriversLocation$Query extends JsonSerializable with EquatableMixin {
  GetDriversLocation$Query();

  factory GetDriversLocation$Query.fromJson(Map<String, dynamic> json) =>
      _$GetDriversLocation$QueryFromJson(json);

  late List<GetDriversLocation$Query$Point> getDriversLocation;

  @override
  List<Object?> get props => [getDriversLocation];
  @override
  Map<String, dynamic> toJson() => _$GetDriversLocation$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetReviewParameters$Query$FeedbackParameter extends JsonSerializable
    with EquatableMixin {
  GetReviewParameters$Query$FeedbackParameter();

  factory GetReviewParameters$Query$FeedbackParameter.fromJson(
          Map<String, dynamic> json) =>
      _$GetReviewParameters$Query$FeedbackParameterFromJson(json);

  late String id;

  late String title;

  late bool isGood;

  @override
  List<Object?> get props => [id, title, isGood];
  @override
  Map<String, dynamic> toJson() =>
      _$GetReviewParameters$Query$FeedbackParameterToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetReviewParameters$Query extends JsonSerializable with EquatableMixin {
  GetReviewParameters$Query();

  factory GetReviewParameters$Query.fromJson(Map<String, dynamic> json) =>
      _$GetReviewParameters$QueryFromJson(json);

  late List<GetReviewParameters$Query$FeedbackParameter> feedbackParameters;

  @override
  List<Object?> get props => [feedbackParameters];
  @override
  Map<String, dynamic> toJson() => _$GetReviewParameters$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetFare$Query$CalculateFareDTO$Point extends JsonSerializable
    with EquatableMixin {
  GetFare$Query$CalculateFareDTO$Point();

  factory GetFare$Query$CalculateFareDTO$Point.fromJson(
          Map<String, dynamic> json) =>
      _$GetFare$Query$CalculateFareDTO$PointFromJson(json);

  late double lat;

  late double lng;

  @override
  List<Object?> get props => [lat, lng];
  @override
  Map<String, dynamic> toJson() =>
      _$GetFare$Query$CalculateFareDTO$PointToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetFare$Query$CalculateFareDTO$ServiceCategory$Service$Media
    extends JsonSerializable with EquatableMixin {
  GetFare$Query$CalculateFareDTO$ServiceCategory$Service$Media();

  factory GetFare$Query$CalculateFareDTO$ServiceCategory$Service$Media.fromJson(
          Map<String, dynamic> json) =>
      _$GetFare$Query$CalculateFareDTO$ServiceCategory$Service$MediaFromJson(
          json);

  late String address;

  @override
  List<Object?> get props => [address];
  @override
  Map<String, dynamic> toJson() =>
      _$GetFare$Query$CalculateFareDTO$ServiceCategory$Service$MediaToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOption
    extends JsonSerializable with EquatableMixin {
  GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOption();

  factory GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOption.fromJson(
          Map<String, dynamic> json) =>
      _$GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOptionFromJson(
          json);

  late String id;

  late String name;

  @JsonKey(unknownEnumValue: ServiceOptionType.artemisUnknown)
  late ServiceOptionType type;

  double? additionalFee;

  @JsonKey(unknownEnumValue: ServiceOptionIcon.artemisUnknown)
  late ServiceOptionIcon icon;

  @override
  List<Object?> get props => [id, name, type, additionalFee, icon];
  @override
  Map<String, dynamic> toJson() =>
      _$GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOptionToJson(
          this);
}

@JsonSerializable(explicitToJson: true)
class GetFare$Query$CalculateFareDTO$ServiceCategory$Service
    extends JsonSerializable with EquatableMixin {
  GetFare$Query$CalculateFareDTO$ServiceCategory$Service();

  factory GetFare$Query$CalculateFareDTO$ServiceCategory$Service.fromJson(
          Map<String, dynamic> json) =>
      _$GetFare$Query$CalculateFareDTO$ServiceCategory$ServiceFromJson(json);

  late String id;

  late String name;

  String? description;

  int? personCapacity;

  late int prepayPercent;

  late bool twoWayAvailable;

  late GetFare$Query$CalculateFareDTO$ServiceCategory$Service$Media media;

  late List<
          GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOption>
      options;

  late double cost;

  double? costAfterCoupon;

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        personCapacity,
        prepayPercent,
        twoWayAvailable,
        media,
        options,
        cost,
        costAfterCoupon
      ];
  @override
  Map<String, dynamic> toJson() =>
      _$GetFare$Query$CalculateFareDTO$ServiceCategory$ServiceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetFare$Query$CalculateFareDTO$ServiceCategory extends JsonSerializable
    with EquatableMixin {
  GetFare$Query$CalculateFareDTO$ServiceCategory();

  factory GetFare$Query$CalculateFareDTO$ServiceCategory.fromJson(
          Map<String, dynamic> json) =>
      _$GetFare$Query$CalculateFareDTO$ServiceCategoryFromJson(json);

  late String id;

  late String name;

  late List<GetFare$Query$CalculateFareDTO$ServiceCategory$Service> services;

  @override
  List<Object?> get props => [id, name, services];
  @override
  Map<String, dynamic> toJson() =>
      _$GetFare$Query$CalculateFareDTO$ServiceCategoryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetFare$Query$CalculateFareDTO extends JsonSerializable
    with EquatableMixin {
  GetFare$Query$CalculateFareDTO();

  factory GetFare$Query$CalculateFareDTO.fromJson(Map<String, dynamic> json) =>
      _$GetFare$Query$CalculateFareDTOFromJson(json);

  late double distance;

  late double duration;

  late String currency;

  late List<GetFare$Query$CalculateFareDTO$Point> directions;

  late List<GetFare$Query$CalculateFareDTO$ServiceCategory> services;

  @JsonKey(unknownEnumValue: CalculateFareError.artemisUnknown)
  CalculateFareError? error;

  @override
  List<Object?> get props =>
      [distance, duration, currency, directions, services, error];
  @override
  Map<String, dynamic> toJson() => _$GetFare$Query$CalculateFareDTOToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetFare$Query extends JsonSerializable with EquatableMixin {
  GetFare$Query();

  factory GetFare$Query.fromJson(Map<String, dynamic> json) =>
      _$GetFare$QueryFromJson(json);

  late GetFare$Query$CalculateFareDTO getFare;

  @override
  List<Object?> get props => [getFare];
  @override
  Map<String, dynamic> toJson() => _$GetFare$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ApplyCoupon$Mutation$Order extends JsonSerializable
    with EquatableMixin, CurrentOrderMixin {
  ApplyCoupon$Mutation$Order();

  factory ApplyCoupon$Mutation$Order.fromJson(Map<String, dynamic> json) =>
      _$ApplyCoupon$Mutation$OrderFromJson(json);

  @override
  List<Object?> get props => [
        id,
        status,
        points,
        driver,
        service,
        directions,
        etaPickup,
        paidAmount,
        costAfterCoupon,
        costBest,
        currency,
        addresses,
        waitMinutes,
        startTimestamp,
        durationBest
      ];
  @override
  Map<String, dynamic> toJson() => _$ApplyCoupon$Mutation$OrderToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ApplyCoupon$Mutation extends JsonSerializable with EquatableMixin {
  ApplyCoupon$Mutation();

  factory ApplyCoupon$Mutation.fromJson(Map<String, dynamic> json) =>
      _$ApplyCoupon$MutationFromJson(json);

  late ApplyCoupon$Mutation$Order applyCoupon;

  @override
  List<Object?> get props => [applyCoupon];
  @override
  Map<String, dynamic> toJson() => _$ApplyCoupon$MutationToJson(this);
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

enum ServiceOptionType {
  @JsonValue('Free')
  free,
  @JsonValue('Paid')
  paid,
  @JsonValue('TwoWay')
  twoWay,
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

enum CalculateFareError {
  @JsonValue('RegionUnsupported')
  regionUnsupported,
  @JsonValue('NoServiceInRegion')
  noServiceInRegion,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

@JsonSerializable(explicitToJson: true)
class GetCurrentOrderArguments extends JsonSerializable with EquatableMixin {
  GetCurrentOrderArguments({required this.versionCode});

  @override
  factory GetCurrentOrderArguments.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentOrderArgumentsFromJson(json);

  late int versionCode;

  @override
  List<Object?> get props => [versionCode];
  @override
  Map<String, dynamic> toJson() => _$GetCurrentOrderArgumentsToJson(this);
}

final GET_CURRENT_ORDER_QUERY_DOCUMENT_OPERATION_NAME = 'GetCurrentOrder';
final GET_CURRENT_ORDER_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetCurrentOrder'),
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
        name: NameNode(value: 'passenger'),
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
            name: NameNode(value: 'orders'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'status'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: 'in'),
                        value: ListValueNode(values: [
                          EnumValueNode(name: NameNode(value: 'Requested')),
                          EnumValueNode(name: NameNode(value: 'Found')),
                          EnumValueNode(name: NameNode(value: 'NotFound')),
                          EnumValueNode(name: NameNode(value: 'NoCloseFound')),
                          EnumValueNode(
                              name: NameNode(value: 'DriverAccepted')),
                          EnumValueNode(name: NameNode(value: 'Arrived')),
                          EnumValueNode(name: NameNode(value: 'Started')),
                          EnumValueNode(
                              name: NameNode(value: 'WaitingForReview')),
                          EnumValueNode(
                              name: NameNode(value: 'WaitingForPostPay')),
                          EnumValueNode(
                              name: NameNode(value: 'WaitingForPrePay')),
                        ]),
                      )
                    ]),
                  )
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
          ),
          FieldNode(
            name: NameNode(value: 'ordersAggregate'),
            alias: NameNode(value: 'bookedOrders'),
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'filter'),
                value: ObjectValueNode(fields: [
                  ObjectFieldNode(
                    name: NameNode(value: 'status'),
                    value: ObjectValueNode(fields: [
                      ObjectFieldNode(
                        name: NameNode(value: 'eq'),
                        value: EnumValueNode(name: NameNode(value: 'Booked')),
                      )
                    ]),
                  )
                ]),
              )
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'count'),
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
          ),
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
      FieldNode(
        name: NameNode(value: 'getCurrentOrderDriverLocation'),
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
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
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
        name: NameNode(value: 'driver'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
          FieldNode(
            name: NameNode(value: 'mobileNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'carPlate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'car'),
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
            name: NameNode(value: 'carColor'),
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
            name: NameNode(value: 'rating'),
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
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cancellationTotalFee'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
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
        name: NameNode(value: 'etaPickup'),
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
        name: NameNode(value: 'costAfterCoupon'),
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
        name: NameNode(value: 'currency'),
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
        name: NameNode(value: 'waitMinutes'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'startTimestamp'),
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

class GetCurrentOrderQuery
    extends GraphQLQuery<GetCurrentOrder$Query, GetCurrentOrderArguments> {
  GetCurrentOrderQuery({required this.variables});

  @override
  final DocumentNode document = GET_CURRENT_ORDER_QUERY_DOCUMENT;

  @override
  final String operationName = GET_CURRENT_ORDER_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetCurrentOrderArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetCurrentOrder$Query parse(Map<String, dynamic> json) =>
      GetCurrentOrder$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class CreateOrderArguments extends JsonSerializable with EquatableMixin {
  CreateOrderArguments({
    required this.input,
    required this.notificationPlayerId,
  });

  @override
  factory CreateOrderArguments.fromJson(Map<String, dynamic> json) =>
      _$CreateOrderArgumentsFromJson(json);

  late CreateOrderInput input;

  late String notificationPlayerId;

  @override
  List<Object?> get props => [input, notificationPlayerId];
  @override
  Map<String, dynamic> toJson() => _$CreateOrderArgumentsToJson(this);
}

final CREATE_ORDER_MUTATION_DOCUMENT_OPERATION_NAME = 'CreateOrder';
final CREATE_ORDER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CreateOrder'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'input')),
        type: NamedTypeNode(
          name: NameNode(value: 'CreateOrderInput'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'notificationPlayerId')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createOrder'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'input')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'CurrentOrder'),
            directives: [],
          )
        ]),
      ),
      FieldNode(
        name: NameNode(value: 'updateOnePassenger'),
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
                    value: VariableNode(
                        name: NameNode(value: 'notificationPlayerId')),
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
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
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
        name: NameNode(value: 'driver'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
          FieldNode(
            name: NameNode(value: 'mobileNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'carPlate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'car'),
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
            name: NameNode(value: 'carColor'),
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
            name: NameNode(value: 'rating'),
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
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cancellationTotalFee'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
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
        name: NameNode(value: 'etaPickup'),
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
        name: NameNode(value: 'costAfterCoupon'),
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
        name: NameNode(value: 'currency'),
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
        name: NameNode(value: 'waitMinutes'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'startTimestamp'),
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

class CreateOrderMutation
    extends GraphQLQuery<CreateOrder$Mutation, CreateOrderArguments> {
  CreateOrderMutation({required this.variables});

  @override
  final DocumentNode document = CREATE_ORDER_MUTATION_DOCUMENT;

  @override
  final String operationName = CREATE_ORDER_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final CreateOrderArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  CreateOrder$Mutation parse(Map<String, dynamic> json) =>
      CreateOrder$Mutation.fromJson(json);
}

final CANCEL_ORDER_MUTATION_DOCUMENT_OPERATION_NAME = 'CancelOrder';
final CANCEL_ORDER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'CancelOrder'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'cancelOrder'),
        alias: null,
        arguments: [],
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
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
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
        name: NameNode(value: 'driver'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
          FieldNode(
            name: NameNode(value: 'mobileNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'carPlate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'car'),
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
            name: NameNode(value: 'carColor'),
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
            name: NameNode(value: 'rating'),
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
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cancellationTotalFee'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
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
        name: NameNode(value: 'etaPickup'),
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
        name: NameNode(value: 'costAfterCoupon'),
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
        name: NameNode(value: 'currency'),
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
        name: NameNode(value: 'waitMinutes'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'startTimestamp'),
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

class CancelOrderMutation
    extends GraphQLQuery<CancelOrder$Mutation, JsonSerializable> {
  CancelOrderMutation();

  @override
  final DocumentNode document = CANCEL_ORDER_MUTATION_DOCUMENT;

  @override
  final String operationName = CANCEL_ORDER_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  CancelOrder$Mutation parse(Map<String, dynamic> json) =>
      CancelOrder$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateOrderArguments extends JsonSerializable with EquatableMixin {
  UpdateOrderArguments({
    required this.id,
    required this.update,
  });

  @override
  factory UpdateOrderArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateOrderArgumentsFromJson(json);

  late String id;

  late UpdateOrderInput update;

  @override
  List<Object?> get props => [id, update];
  @override
  Map<String, dynamic> toJson() => _$UpdateOrderArgumentsToJson(this);
}

final UPDATE_ORDER_MUTATION_DOCUMENT_OPERATION_NAME = 'updateOrder';
final UPDATE_ORDER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'updateOrder'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'update')),
        type: NamedTypeNode(
          name: NameNode(value: 'UpdateOrderInput'),
          isNonNull: true,
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
                value: VariableNode(name: NameNode(value: 'id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'update'),
                value: VariableNode(name: NameNode(value: 'update')),
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
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
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
        name: NameNode(value: 'driver'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
          FieldNode(
            name: NameNode(value: 'mobileNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'carPlate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'car'),
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
            name: NameNode(value: 'carColor'),
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
            name: NameNode(value: 'rating'),
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
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cancellationTotalFee'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
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
        name: NameNode(value: 'etaPickup'),
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
        name: NameNode(value: 'costAfterCoupon'),
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
        name: NameNode(value: 'currency'),
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
        name: NameNode(value: 'waitMinutes'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'startTimestamp'),
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

class UpdateOrderMutation
    extends GraphQLQuery<UpdateOrder$Mutation, UpdateOrderArguments> {
  UpdateOrderMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_ORDER_MUTATION_DOCUMENT;

  @override
  final String operationName = UPDATE_ORDER_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UpdateOrderArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateOrder$Mutation parse(Map<String, dynamic> json) =>
      UpdateOrder$Mutation.fromJson(json);
}

final UPDATED_ORDER_SUBSCRIPTION_DOCUMENT_OPERATION_NAME = 'UpdatedOrder';
final UPDATED_ORDER_SUBSCRIPTION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'UpdatedOrder'),
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
          ),
          FieldNode(
            name: NameNode(value: 'status'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
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
            name: NameNode(value: 'driver'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
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
              FieldNode(
                name: NameNode(value: 'mobileNumber'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'carPlate'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'car'),
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
                name: NameNode(value: 'carColor'),
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
                name: NameNode(value: 'rating'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
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
            name: NameNode(value: 'service'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
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
                name: NameNode(value: 'name'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'cancellationTotalFee'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'etaPickup'),
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
            name: NameNode(value: 'costAfterCoupon'),
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
            name: NameNode(value: 'startTimestamp'),
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
            name: NameNode(value: 'currency'),
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
            name: NameNode(value: 'waitMinutes'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
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

class UpdatedOrderSubscription
    extends GraphQLQuery<UpdatedOrder$Subscription, JsonSerializable> {
  UpdatedOrderSubscription();

  @override
  final DocumentNode document = UPDATED_ORDER_SUBSCRIPTION_DOCUMENT;

  @override
  final String operationName =
      UPDATED_ORDER_SUBSCRIPTION_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  UpdatedOrder$Subscription parse(Map<String, dynamic> json) =>
      UpdatedOrder$Subscription.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class DriverLocationUpdatedArguments extends JsonSerializable
    with EquatableMixin {
  DriverLocationUpdatedArguments({required this.driverId});

  @override
  factory DriverLocationUpdatedArguments.fromJson(Map<String, dynamic> json) =>
      _$DriverLocationUpdatedArgumentsFromJson(json);

  late String driverId;

  @override
  List<Object?> get props => [driverId];
  @override
  Map<String, dynamic> toJson() => _$DriverLocationUpdatedArgumentsToJson(this);
}

final DRIVER_LOCATION_UPDATED_SUBSCRIPTION_DOCUMENT_OPERATION_NAME =
    'DriverLocationUpdated';
final DRIVER_LOCATION_UPDATED_SUBSCRIPTION_DOCUMENT =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'DriverLocationUpdated'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'driverId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'driverLocationUpdated'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'driverId'),
            value: VariableNode(name: NameNode(value: 'driverId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      )
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

class DriverLocationUpdatedSubscription extends GraphQLQuery<
    DriverLocationUpdated$Subscription, DriverLocationUpdatedArguments> {
  DriverLocationUpdatedSubscription({required this.variables});

  @override
  final DocumentNode document = DRIVER_LOCATION_UPDATED_SUBSCRIPTION_DOCUMENT;

  @override
  final String operationName =
      DRIVER_LOCATION_UPDATED_SUBSCRIPTION_DOCUMENT_OPERATION_NAME;

  @override
  final DriverLocationUpdatedArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  DriverLocationUpdated$Subscription parse(Map<String, dynamic> json) =>
      DriverLocationUpdated$Subscription.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SubmitFeedbackArguments extends JsonSerializable with EquatableMixin {
  SubmitFeedbackArguments({
    required this.score,
    required this.description,
    required this.orderId,
    required this.parameterIds,
  });

  @override
  factory SubmitFeedbackArguments.fromJson(Map<String, dynamic> json) =>
      _$SubmitFeedbackArgumentsFromJson(json);

  late int score;

  late String description;

  late String orderId;

  late List<String> parameterIds;

  @override
  List<Object?> get props => [score, description, orderId, parameterIds];
  @override
  Map<String, dynamic> toJson() => _$SubmitFeedbackArgumentsToJson(this);
}

final SUBMIT_FEEDBACK_MUTATION_DOCUMENT_OPERATION_NAME = 'SubmitFeedback';
final SUBMIT_FEEDBACK_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'SubmitFeedback'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'score')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'description')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
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
        variable: VariableNode(name: NameNode(value: 'parameterIds')),
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
        name: NameNode(value: 'submitReview'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'review'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'score'),
                value: VariableNode(name: NameNode(value: 'score')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'description'),
                value: VariableNode(name: NameNode(value: 'description')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'requestId'),
                value: VariableNode(name: NameNode(value: 'orderId')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'parameterIds'),
                value: VariableNode(name: NameNode(value: 'parameterIds')),
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
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
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
        name: NameNode(value: 'driver'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
          FieldNode(
            name: NameNode(value: 'mobileNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'carPlate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'car'),
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
            name: NameNode(value: 'carColor'),
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
            name: NameNode(value: 'rating'),
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
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cancellationTotalFee'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
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
        name: NameNode(value: 'etaPickup'),
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
        name: NameNode(value: 'costAfterCoupon'),
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
        name: NameNode(value: 'currency'),
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
        name: NameNode(value: 'waitMinutes'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'startTimestamp'),
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

class SubmitFeedbackMutation
    extends GraphQLQuery<SubmitFeedback$Mutation, SubmitFeedbackArguments> {
  SubmitFeedbackMutation({required this.variables});

  @override
  final DocumentNode document = SUBMIT_FEEDBACK_MUTATION_DOCUMENT;

  @override
  final String operationName = SUBMIT_FEEDBACK_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final SubmitFeedbackArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  SubmitFeedback$Mutation parse(Map<String, dynamic> json) =>
      SubmitFeedback$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetDriversLocationArguments extends JsonSerializable with EquatableMixin {
  GetDriversLocationArguments({this.point});

  @override
  factory GetDriversLocationArguments.fromJson(Map<String, dynamic> json) =>
      _$GetDriversLocationArgumentsFromJson(json);

  final PointInput? point;

  @override
  List<Object?> get props => [point];
  @override
  Map<String, dynamic> toJson() => _$GetDriversLocationArgumentsToJson(this);
}

final GET_DRIVERS_LOCATION_QUERY_DOCUMENT_OPERATION_NAME = 'GetDriversLocation';
final GET_DRIVERS_LOCATION_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetDriversLocation'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'point')),
        type: NamedTypeNode(
          name: NameNode(value: 'PointInput'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getDriversLocation'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'center'),
            value: VariableNode(name: NameNode(value: 'point')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FragmentSpreadNode(
            name: NameNode(value: 'Point'),
            directives: [],
          )
        ]),
      )
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

class GetDriversLocationQuery extends GraphQLQuery<GetDriversLocation$Query,
    GetDriversLocationArguments> {
  GetDriversLocationQuery({required this.variables});

  @override
  final DocumentNode document = GET_DRIVERS_LOCATION_QUERY_DOCUMENT;

  @override
  final String operationName =
      GET_DRIVERS_LOCATION_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetDriversLocationArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetDriversLocation$Query parse(Map<String, dynamic> json) =>
      GetDriversLocation$Query.fromJson(json);
}

final GET_REVIEW_PARAMETERS_QUERY_DOCUMENT_OPERATION_NAME =
    'GetReviewParameters';
final GET_REVIEW_PARAMETERS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetReviewParameters'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'feedbackParameters'),
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
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'isGood'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class GetReviewParametersQuery
    extends GraphQLQuery<GetReviewParameters$Query, JsonSerializable> {
  GetReviewParametersQuery();

  @override
  final DocumentNode document = GET_REVIEW_PARAMETERS_QUERY_DOCUMENT;

  @override
  final String operationName =
      GET_REVIEW_PARAMETERS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetReviewParameters$Query parse(Map<String, dynamic> json) =>
      GetReviewParameters$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetFareArguments extends JsonSerializable with EquatableMixin {
  GetFareArguments({
    required this.points,
    this.couponCode,
    this.selectedOptionIds,
  });

  @override
  factory GetFareArguments.fromJson(Map<String, dynamic> json) =>
      _$GetFareArgumentsFromJson(json);

  late List<PointInput> points;

  final String? couponCode;

  final List<String>? selectedOptionIds;

  @override
  List<Object?> get props => [points, couponCode, selectedOptionIds];
  @override
  Map<String, dynamic> toJson() => _$GetFareArgumentsToJson(this);
}

final GET_FARE_QUERY_DOCUMENT_OPERATION_NAME = 'GetFare';
final GET_FARE_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetFare'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'points')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'PointInput'),
            isNonNull: true,
          ),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'couponCode')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'selectedOptionIds')),
        type: ListTypeNode(
          type: NamedTypeNode(
            name: NameNode(value: 'String'),
            isNonNull: true,
          ),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getFare'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'points'),
                value: VariableNode(name: NameNode(value: 'points')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'couponCode'),
                value: VariableNode(name: NameNode(value: 'couponCode')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'selectedOptionIds'),
                value: VariableNode(name: NameNode(value: 'selectedOptionIds')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'distance'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'duration'),
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
            name: NameNode(value: 'directions'),
            alias: null,
            arguments: [],
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
          FieldNode(
            name: NameNode(value: 'services'),
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
                name: NameNode(value: 'services'),
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
                    name: NameNode(value: 'description'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'personCapacity'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'prepayPercent'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null,
                  ),
                  FieldNode(
                    name: NameNode(value: 'twoWayAvailable'),
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
                        name: NameNode(value: 'type'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null,
                      ),
                      FieldNode(
                        name: NameNode(value: 'additionalFee'),
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
                    name: NameNode(value: 'cost'),
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
                ]),
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'error'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class GetFareQuery extends GraphQLQuery<GetFare$Query, GetFareArguments> {
  GetFareQuery({required this.variables});

  @override
  final DocumentNode document = GET_FARE_QUERY_DOCUMENT;

  @override
  final String operationName = GET_FARE_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetFareArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetFare$Query parse(Map<String, dynamic> json) =>
      GetFare$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ApplyCouponArguments extends JsonSerializable with EquatableMixin {
  ApplyCouponArguments({required this.code});

  @override
  factory ApplyCouponArguments.fromJson(Map<String, dynamic> json) =>
      _$ApplyCouponArgumentsFromJson(json);

  late String code;

  @override
  List<Object?> get props => [code];
  @override
  Map<String, dynamic> toJson() => _$ApplyCouponArgumentsToJson(this);
}

final APPLY_COUPON_MUTATION_DOCUMENT_OPERATION_NAME = 'ApplyCoupon';
final APPLY_COUPON_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'ApplyCoupon'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'code')),
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
        name: NameNode(value: 'applyCoupon'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'code'),
            value: VariableNode(name: NameNode(value: 'code')),
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
        name: NameNode(value: 'status'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
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
        name: NameNode(value: 'driver'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
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
          FieldNode(
            name: NameNode(value: 'mobileNumber'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'carPlate'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'car'),
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
            name: NameNode(value: 'carColor'),
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
            name: NameNode(value: 'rating'),
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
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'cancellationTotalFee'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
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
        name: NameNode(value: 'etaPickup'),
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
        name: NameNode(value: 'costAfterCoupon'),
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
        name: NameNode(value: 'currency'),
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
        name: NameNode(value: 'waitMinutes'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
      FieldNode(
        name: NameNode(value: 'startTimestamp'),
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

class ApplyCouponMutation
    extends GraphQLQuery<ApplyCoupon$Mutation, ApplyCouponArguments> {
  ApplyCouponMutation({required this.variables});

  @override
  final DocumentNode document = APPLY_COUPON_MUTATION_DOCUMENT;

  @override
  final String operationName = APPLY_COUPON_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final ApplyCouponArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  ApplyCoupon$Mutation parse(Map<String, dynamic> json) =>
      ApplyCoupon$Mutation.fromJson(json);
}
