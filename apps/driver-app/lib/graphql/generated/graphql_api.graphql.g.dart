// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Me$Query$Driver _$Me$Query$DriverFromJson(Map<String, dynamic> json) =>
    Me$Query$Driver()
      ..mobileNumber = json['mobileNumber'] as String
      ..firstName = json['firstName'] as String?
      ..lastName = json['lastName'] as String?
      ..searchDistance = json['searchDistance'] as int?
      ..media = json['media'] == null
          ? null
          : BasicProfileMixin$Media.fromJson(
              json['media'] as Map<String, dynamic>)
      ..softRejectionNote = json['softRejectionNote'] as String?
      ..status = $enumDecode(_$DriverStatusEnumMap, json['status'],
          unknownValue: DriverStatus.artemisUnknown)
      ..currentOrders = (json['currentOrders'] as List<dynamic>)
          .map((e) =>
              BasicProfileMixin$Order.fromJson(e as Map<String, dynamic>))
          .toList()
      ..wallets = (json['wallets'] as List<dynamic>)
          .map((e) => BasicProfileMixin$DriverWallet.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$Me$Query$DriverToJson(Me$Query$Driver instance) {
  final val = <String, dynamic>{
    'mobileNumber': instance.mobileNumber,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('searchDistance', instance.searchDistance);
  writeNotNull('media', instance.media?.toJson());
  writeNotNull('softRejectionNote', instance.softRejectionNote);
  val['status'] = _$DriverStatusEnumMap[instance.status]!;
  val['currentOrders'] = instance.currentOrders.map((e) => e.toJson()).toList();
  val['wallets'] = instance.wallets.map((e) => e.toJson()).toList();
  return val;
}

const _$DriverStatusEnumMap = {
  DriverStatus.online: 'Online',
  DriverStatus.offline: 'Offline',
  DriverStatus.blocked: 'Blocked',
  DriverStatus.inService: 'InService',
  DriverStatus.waitingDocuments: 'WaitingDocuments',
  DriverStatus.pendingApproval: 'PendingApproval',
  DriverStatus.softReject: 'SoftReject',
  DriverStatus.hardReject: 'HardReject',
  DriverStatus.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

Me$Query _$Me$QueryFromJson(Map<String, dynamic> json) => Me$Query()
  ..driver = Me$Query$Driver.fromJson(json['driver'] as Map<String, dynamic>)
  ..requireUpdate = $enumDecode(_$VersionStatusEnumMap, json['requireUpdate'],
      unknownValue: VersionStatus.artemisUnknown);

Map<String, dynamic> _$Me$QueryToJson(Me$Query instance) => <String, dynamic>{
      'driver': instance.driver.toJson(),
      'requireUpdate': _$VersionStatusEnumMap[instance.requireUpdate]!,
    };

const _$VersionStatusEnumMap = {
  VersionStatus.latest: 'Latest',
  VersionStatus.mandatoryUpdate: 'MandatoryUpdate',
  VersionStatus.optionalUpdate: 'OptionalUpdate',
  VersionStatus.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

BasicProfileMixin$Media _$BasicProfileMixin$MediaFromJson(
        Map<String, dynamic> json) =>
    BasicProfileMixin$Media()..address = json['address'] as String;

Map<String, dynamic> _$BasicProfileMixin$MediaToJson(
        BasicProfileMixin$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

BasicProfileMixin$Order _$BasicProfileMixin$OrderFromJson(
        Map<String, dynamic> json) =>
    BasicProfileMixin$Order()
      ..id = json['id'] as String
      ..createdOn = fromGraphQLTimestampToDartDateTime(json['createdOn'] as int)
      ..expectedTimestamp =
          fromGraphQLTimestampToDartDateTime(json['expectedTimestamp'] as int)
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..currency = json['currency'] as String
      ..costBest = (json['costBest'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..tipAmount = (json['tipAmount'] as num).toDouble()
      ..directions = (json['directions'] as List<dynamic>)
          .map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..service = CurrentOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..options = (json['options'] as List<dynamic>)
          .map((e) => CurrentOrderMixin$ServiceOption.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..passenger = CurrentOrderMixin$Passenger.fromJson(
          json['passenger'] as Map<String, dynamic>);

Map<String, dynamic> _$BasicProfileMixin$OrderToJson(
    BasicProfileMixin$Order instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'createdOn': fromDartDateTimeToGraphQLTimestamp(instance.createdOn),
    'expectedTimestamp':
        fromDartDateTimeToGraphQLTimestamp(instance.expectedTimestamp),
    'status': _$OrderStatusEnumMap[instance.status]!,
    'currency': instance.currency,
    'costBest': instance.costBest,
    'costAfterCoupon': instance.costAfterCoupon,
    'paidAmount': instance.paidAmount,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('etaPickup',
      fromDartDateTimeNullableToGraphQLTimestampNullable(instance.etaPickup));
  val['tipAmount'] = instance.tipAmount;
  val['directions'] = instance.directions.map((e) => e.toJson()).toList();
  val['points'] = instance.points.map((e) => e.toJson()).toList();
  val['service'] = instance.service.toJson();
  val['options'] = instance.options.map((e) => e.toJson()).toList();
  val['addresses'] = instance.addresses;
  val['passenger'] = instance.passenger.toJson();
  return val;
}

const _$OrderStatusEnumMap = {
  OrderStatus.requested: 'Requested',
  OrderStatus.notFound: 'NotFound',
  OrderStatus.noCloseFound: 'NoCloseFound',
  OrderStatus.found: 'Found',
  OrderStatus.driverAccepted: 'DriverAccepted',
  OrderStatus.arrived: 'Arrived',
  OrderStatus.waitingForPrePay: 'WaitingForPrePay',
  OrderStatus.driverCanceled: 'DriverCanceled',
  OrderStatus.passengerCanceled: 'PassengerCanceled',
  OrderStatus.started: 'Started',
  OrderStatus.waitingForPostPay: 'WaitingForPostPay',
  OrderStatus.waitingForReview: 'WaitingForReview',
  OrderStatus.finished: 'Finished',
  OrderStatus.booked: 'Booked',
  OrderStatus.expired: 'Expired',
  OrderStatus.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

BasicProfileMixin$DriverWallet _$BasicProfileMixin$DriverWalletFromJson(
        Map<String, dynamic> json) =>
    BasicProfileMixin$DriverWallet()
      ..balance = (json['balance'] as num).toDouble()
      ..currency = json['currency'] as String;

Map<String, dynamic> _$BasicProfileMixin$DriverWalletToJson(
        BasicProfileMixin$DriverWallet instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'currency': instance.currency,
    };

CurrentOrderMixin$Point _$CurrentOrderMixin$PointFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Point()
      ..lat = (json['lat'] as num).toDouble()
      ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$CurrentOrderMixin$PointToJson(
        CurrentOrderMixin$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

CurrentOrderMixin$Service _$CurrentOrderMixin$ServiceFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Service()..name = json['name'] as String;

Map<String, dynamic> _$CurrentOrderMixin$ServiceToJson(
        CurrentOrderMixin$Service instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

CurrentOrderMixin$ServiceOption _$CurrentOrderMixin$ServiceOptionFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$ServiceOption()
      ..id = json['id'] as String
      ..name = json['name'] as String
      ..icon = $enumDecode(_$ServiceOptionIconEnumMap, json['icon'],
          unknownValue: ServiceOptionIcon.artemisUnknown);

Map<String, dynamic> _$CurrentOrderMixin$ServiceOptionToJson(
        CurrentOrderMixin$ServiceOption instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': _$ServiceOptionIconEnumMap[instance.icon]!,
    };

const _$ServiceOptionIconEnumMap = {
  ServiceOptionIcon.pet: 'Pet',
  ServiceOptionIcon.twoWay: 'TwoWay',
  ServiceOptionIcon.luggage: 'Luggage',
  ServiceOptionIcon.packageDelivery: 'PackageDelivery',
  ServiceOptionIcon.shopping: 'Shopping',
  ServiceOptionIcon.custom1: 'Custom1',
  ServiceOptionIcon.custom2: 'Custom2',
  ServiceOptionIcon.custom3: 'Custom3',
  ServiceOptionIcon.custom4: 'Custom4',
  ServiceOptionIcon.custom5: 'Custom5',
  ServiceOptionIcon.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

CurrentOrderMixin$Passenger$Media _$CurrentOrderMixin$Passenger$MediaFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Passenger$Media()..address = json['address'] as String;

Map<String, dynamic> _$CurrentOrderMixin$Passenger$MediaToJson(
        CurrentOrderMixin$Passenger$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

CurrentOrderMixin$Passenger _$CurrentOrderMixin$PassengerFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Passenger()
      ..mobileNumber = json['mobileNumber'] as String
      ..firstName = json['firstName'] as String?
      ..lastName = json['lastName'] as String?
      ..media = json['media'] == null
          ? null
          : CurrentOrderMixin$Passenger$Media.fromJson(
              json['media'] as Map<String, dynamic>);

Map<String, dynamic> _$CurrentOrderMixin$PassengerToJson(
    CurrentOrderMixin$Passenger instance) {
  final val = <String, dynamic>{
    'mobileNumber': instance.mobileNumber,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('media', instance.media?.toJson());
  return val;
}

AvailableOrders$Query$Order _$AvailableOrders$Query$OrderFromJson(
        Map<String, dynamic> json) =>
    AvailableOrders$Query$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..currency = json['currency'] as String
      ..costBest = (json['costBest'] as num).toDouble()
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..distanceBest = json['distanceBest'] as int
      ..durationBest = json['durationBest'] as int
      ..directions = (json['directions'] as List<dynamic>)
          .map((e) =>
              AvailableOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..options = (json['options'] as List<dynamic>)
          .map((e) => AvailableOrderMixin$ServiceOption.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..service = AvailableOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              AvailableOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AvailableOrders$Query$OrderToJson(
        AvailableOrders$Query$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'currency': instance.currency,
      'costBest': instance.costBest,
      'addresses': instance.addresses,
      'distanceBest': instance.distanceBest,
      'durationBest': instance.durationBest,
      'directions': instance.directions.map((e) => e.toJson()).toList(),
      'options': instance.options.map((e) => e.toJson()).toList(),
      'service': instance.service.toJson(),
      'points': instance.points.map((e) => e.toJson()).toList(),
    };

AvailableOrders$Query _$AvailableOrders$QueryFromJson(
        Map<String, dynamic> json) =>
    AvailableOrders$Query()
      ..availableOrders = (json['availableOrders'] as List<dynamic>)
          .map((e) =>
              AvailableOrders$Query$Order.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AvailableOrders$QueryToJson(
        AvailableOrders$Query instance) =>
    <String, dynamic>{
      'availableOrders':
          instance.availableOrders.map((e) => e.toJson()).toList(),
    };

AvailableOrderMixin$Point _$AvailableOrderMixin$PointFromJson(
        Map<String, dynamic> json) =>
    AvailableOrderMixin$Point()
      ..lat = (json['lat'] as num).toDouble()
      ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$AvailableOrderMixin$PointToJson(
        AvailableOrderMixin$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

AvailableOrderMixin$ServiceOption _$AvailableOrderMixin$ServiceOptionFromJson(
        Map<String, dynamic> json) =>
    AvailableOrderMixin$ServiceOption()
      ..name = json['name'] as String
      ..icon = $enumDecode(_$ServiceOptionIconEnumMap, json['icon'],
          unknownValue: ServiceOptionIcon.artemisUnknown);

Map<String, dynamic> _$AvailableOrderMixin$ServiceOptionToJson(
        AvailableOrderMixin$ServiceOption instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': _$ServiceOptionIconEnumMap[instance.icon]!,
    };

AvailableOrderMixin$Service _$AvailableOrderMixin$ServiceFromJson(
        Map<String, dynamic> json) =>
    AvailableOrderMixin$Service()..name = json['name'] as String;

Map<String, dynamic> _$AvailableOrderMixin$ServiceToJson(
        AvailableOrderMixin$Service instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

OrderCreated$Subscription$Order _$OrderCreated$Subscription$OrderFromJson(
        Map<String, dynamic> json) =>
    OrderCreated$Subscription$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..currency = json['currency'] as String
      ..costBest = (json['costBest'] as num).toDouble()
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..distanceBest = json['distanceBest'] as int
      ..durationBest = json['durationBest'] as int
      ..directions = (json['directions'] as List<dynamic>)
          .map((e) =>
              AvailableOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..options = (json['options'] as List<dynamic>)
          .map((e) => AvailableOrderMixin$ServiceOption.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..service = AvailableOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              AvailableOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$OrderCreated$Subscription$OrderToJson(
        OrderCreated$Subscription$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'currency': instance.currency,
      'costBest': instance.costBest,
      'addresses': instance.addresses,
      'distanceBest': instance.distanceBest,
      'durationBest': instance.durationBest,
      'directions': instance.directions.map((e) => e.toJson()).toList(),
      'options': instance.options.map((e) => e.toJson()).toList(),
      'service': instance.service.toJson(),
      'points': instance.points.map((e) => e.toJson()).toList(),
    };

OrderCreated$Subscription _$OrderCreated$SubscriptionFromJson(
        Map<String, dynamic> json) =>
    OrderCreated$Subscription()
      ..orderCreated = OrderCreated$Subscription$Order.fromJson(
          json['orderCreated'] as Map<String, dynamic>);

Map<String, dynamic> _$OrderCreated$SubscriptionToJson(
        OrderCreated$Subscription instance) =>
    <String, dynamic>{
      'orderCreated': instance.orderCreated.toJson(),
    };

OrderRemoved$Subscription$Order _$OrderRemoved$Subscription$OrderFromJson(
        Map<String, dynamic> json) =>
    OrderRemoved$Subscription$Order()..id = json['id'] as String;

Map<String, dynamic> _$OrderRemoved$Subscription$OrderToJson(
        OrderRemoved$Subscription$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

OrderRemoved$Subscription _$OrderRemoved$SubscriptionFromJson(
        Map<String, dynamic> json) =>
    OrderRemoved$Subscription()
      ..orderRemoved = OrderRemoved$Subscription$Order.fromJson(
          json['orderRemoved'] as Map<String, dynamic>);

Map<String, dynamic> _$OrderRemoved$SubscriptionToJson(
        OrderRemoved$Subscription instance) =>
    <String, dynamic>{
      'orderRemoved': instance.orderRemoved.toJson(),
    };

OrderUpdated$Subscription$Order _$OrderUpdated$Subscription$OrderFromJson(
        Map<String, dynamic> json) =>
    OrderUpdated$Subscription$Order()..id = json['id'] as String;

Map<String, dynamic> _$OrderUpdated$Subscription$OrderToJson(
        OrderUpdated$Subscription$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

OrderUpdated$Subscription _$OrderUpdated$SubscriptionFromJson(
        Map<String, dynamic> json) =>
    OrderUpdated$Subscription()
      ..orderUpdated = OrderUpdated$Subscription$Order.fromJson(
          json['orderUpdated'] as Map<String, dynamic>);

Map<String, dynamic> _$OrderUpdated$SubscriptionToJson(
        OrderUpdated$Subscription instance) =>
    <String, dynamic>{
      'orderUpdated': instance.orderUpdated.toJson(),
    };

UpdateDriverLocation$Mutation$Order
    _$UpdateDriverLocation$Mutation$OrderFromJson(Map<String, dynamic> json) =>
        UpdateDriverLocation$Mutation$Order()
          ..id = json['id'] as String
          ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
              unknownValue: OrderStatus.artemisUnknown)
          ..currency = json['currency'] as String
          ..costBest = (json['costBest'] as num).toDouble()
          ..addresses = (json['addresses'] as List<dynamic>)
              .map((e) => e as String)
              .toList()
          ..distanceBest = json['distanceBest'] as int
          ..durationBest = json['durationBest'] as int
          ..directions = (json['directions'] as List<dynamic>)
              .map((e) =>
                  AvailableOrderMixin$Point.fromJson(e as Map<String, dynamic>))
              .toList()
          ..options = (json['options'] as List<dynamic>)
              .map((e) => AvailableOrderMixin$ServiceOption.fromJson(
                  e as Map<String, dynamic>))
              .toList()
          ..service = AvailableOrderMixin$Service.fromJson(
              json['service'] as Map<String, dynamic>)
          ..points = (json['points'] as List<dynamic>)
              .map((e) =>
                  AvailableOrderMixin$Point.fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$UpdateDriverLocation$Mutation$OrderToJson(
        UpdateDriverLocation$Mutation$Order instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'currency': instance.currency,
      'costBest': instance.costBest,
      'addresses': instance.addresses,
      'distanceBest': instance.distanceBest,
      'durationBest': instance.durationBest,
      'directions': instance.directions.map((e) => e.toJson()).toList(),
      'options': instance.options.map((e) => e.toJson()).toList(),
      'service': instance.service.toJson(),
      'points': instance.points.map((e) => e.toJson()).toList(),
    };

UpdateDriverLocation$Mutation _$UpdateDriverLocation$MutationFromJson(
        Map<String, dynamic> json) =>
    UpdateDriverLocation$Mutation()
      ..updateDriversLocationNew =
          (json['updateDriversLocationNew'] as List<dynamic>)
              .map((e) => UpdateDriverLocation$Mutation$Order.fromJson(
                  e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$UpdateDriverLocation$MutationToJson(
        UpdateDriverLocation$Mutation instance) =>
    <String, dynamic>{
      'updateDriversLocationNew':
          instance.updateDriversLocationNew.map((e) => e.toJson()).toList(),
    };

PointInput _$PointInputFromJson(Map<String, dynamic> json) => PointInput(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$PointInputToJson(PointInput instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

UpdateOrderStatus$Mutation$Order _$UpdateOrderStatus$Mutation$OrderFromJson(
        Map<String, dynamic> json) =>
    UpdateOrderStatus$Mutation$Order()
      ..id = json['id'] as String
      ..createdOn = fromGraphQLTimestampToDartDateTime(json['createdOn'] as int)
      ..expectedTimestamp =
          fromGraphQLTimestampToDartDateTime(json['expectedTimestamp'] as int)
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..currency = json['currency'] as String
      ..costBest = (json['costBest'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..tipAmount = (json['tipAmount'] as num).toDouble()
      ..directions = (json['directions'] as List<dynamic>)
          .map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..service = CurrentOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..options = (json['options'] as List<dynamic>)
          .map((e) => CurrentOrderMixin$ServiceOption.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..passenger = CurrentOrderMixin$Passenger.fromJson(
          json['passenger'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateOrderStatus$Mutation$OrderToJson(
    UpdateOrderStatus$Mutation$Order instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'createdOn': fromDartDateTimeToGraphQLTimestamp(instance.createdOn),
    'expectedTimestamp':
        fromDartDateTimeToGraphQLTimestamp(instance.expectedTimestamp),
    'status': _$OrderStatusEnumMap[instance.status]!,
    'currency': instance.currency,
    'costBest': instance.costBest,
    'costAfterCoupon': instance.costAfterCoupon,
    'paidAmount': instance.paidAmount,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('etaPickup',
      fromDartDateTimeNullableToGraphQLTimestampNullable(instance.etaPickup));
  val['tipAmount'] = instance.tipAmount;
  val['directions'] = instance.directions.map((e) => e.toJson()).toList();
  val['points'] = instance.points.map((e) => e.toJson()).toList();
  val['service'] = instance.service.toJson();
  val['options'] = instance.options.map((e) => e.toJson()).toList();
  val['addresses'] = instance.addresses;
  val['passenger'] = instance.passenger.toJson();
  return val;
}

UpdateOrderStatus$Mutation _$UpdateOrderStatus$MutationFromJson(
        Map<String, dynamic> json) =>
    UpdateOrderStatus$Mutation()
      ..updateOneOrder = UpdateOrderStatus$Mutation$Order.fromJson(
          json['updateOneOrder'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateOrderStatus$MutationToJson(
        UpdateOrderStatus$Mutation instance) =>
    <String, dynamic>{
      'updateOneOrder': instance.updateOneOrder.toJson(),
    };

UpdateDriverStatus$Mutation$Driver _$UpdateDriverStatus$Mutation$DriverFromJson(
        Map<String, dynamic> json) =>
    UpdateDriverStatus$Mutation$Driver()
      ..mobileNumber = json['mobileNumber'] as String
      ..firstName = json['firstName'] as String?
      ..lastName = json['lastName'] as String?
      ..searchDistance = json['searchDistance'] as int?
      ..media = json['media'] == null
          ? null
          : BasicProfileMixin$Media.fromJson(
              json['media'] as Map<String, dynamic>)
      ..softRejectionNote = json['softRejectionNote'] as String?
      ..status = $enumDecode(_$DriverStatusEnumMap, json['status'],
          unknownValue: DriverStatus.artemisUnknown)
      ..currentOrders = (json['currentOrders'] as List<dynamic>)
          .map((e) =>
              BasicProfileMixin$Order.fromJson(e as Map<String, dynamic>))
          .toList()
      ..wallets = (json['wallets'] as List<dynamic>)
          .map((e) => BasicProfileMixin$DriverWallet.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$UpdateDriverStatus$Mutation$DriverToJson(
    UpdateDriverStatus$Mutation$Driver instance) {
  final val = <String, dynamic>{
    'mobileNumber': instance.mobileNumber,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('searchDistance', instance.searchDistance);
  writeNotNull('media', instance.media?.toJson());
  writeNotNull('softRejectionNote', instance.softRejectionNote);
  val['status'] = _$DriverStatusEnumMap[instance.status]!;
  val['currentOrders'] = instance.currentOrders.map((e) => e.toJson()).toList();
  val['wallets'] = instance.wallets.map((e) => e.toJson()).toList();
  return val;
}

UpdateDriverStatus$Mutation _$UpdateDriverStatus$MutationFromJson(
        Map<String, dynamic> json) =>
    UpdateDriverStatus$Mutation()
      ..updateOneDriver = UpdateDriverStatus$Mutation$Driver.fromJson(
          json['updateOneDriver'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateDriverStatus$MutationToJson(
        UpdateDriverStatus$Mutation instance) =>
    <String, dynamic>{
      'updateOneDriver': instance.updateOneDriver.toJson(),
    };

UpdateDriverFCMId$Mutation$Driver _$UpdateDriverFCMId$Mutation$DriverFromJson(
        Map<String, dynamic> json) =>
    UpdateDriverFCMId$Mutation$Driver()..id = json['id'] as String;

Map<String, dynamic> _$UpdateDriverFCMId$Mutation$DriverToJson(
        UpdateDriverFCMId$Mutation$Driver instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

UpdateDriverFCMId$Mutation _$UpdateDriverFCMId$MutationFromJson(
        Map<String, dynamic> json) =>
    UpdateDriverFCMId$Mutation()
      ..updateOneDriver = UpdateDriverFCMId$Mutation$Driver.fromJson(
          json['updateOneDriver'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateDriverFCMId$MutationToJson(
        UpdateDriverFCMId$Mutation instance) =>
    <String, dynamic>{
      'updateOneDriver': instance.updateOneDriver.toJson(),
    };

UpdateDriverSearchDistance$Mutation$Driver
    _$UpdateDriverSearchDistance$Mutation$DriverFromJson(
            Map<String, dynamic> json) =>
        UpdateDriverSearchDistance$Mutation$Driver()..id = json['id'] as String;

Map<String, dynamic> _$UpdateDriverSearchDistance$Mutation$DriverToJson(
        UpdateDriverSearchDistance$Mutation$Driver instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

UpdateDriverSearchDistance$Mutation
    _$UpdateDriverSearchDistance$MutationFromJson(Map<String, dynamic> json) =>
        UpdateDriverSearchDistance$Mutation()
          ..updateOneDriver =
              UpdateDriverSearchDistance$Mutation$Driver.fromJson(
                  json['updateOneDriver'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateDriverSearchDistance$MutationToJson(
        UpdateDriverSearchDistance$Mutation instance) =>
    <String, dynamic>{
      'updateOneDriver': instance.updateOneDriver.toJson(),
    };

MeArguments _$MeArgumentsFromJson(Map<String, dynamic> json) => MeArguments(
      versionCode: json['versionCode'] as int,
    );

Map<String, dynamic> _$MeArgumentsToJson(MeArguments instance) =>
    <String, dynamic>{
      'versionCode': instance.versionCode,
    };

UpdateDriverLocationArguments _$UpdateDriverLocationArgumentsFromJson(
        Map<String, dynamic> json) =>
    UpdateDriverLocationArguments(
      point: PointInput.fromJson(json['point'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateDriverLocationArgumentsToJson(
        UpdateDriverLocationArguments instance) =>
    <String, dynamic>{
      'point': instance.point.toJson(),
    };

UpdateOrderStatusArguments _$UpdateOrderStatusArgumentsFromJson(
        Map<String, dynamic> json) =>
    UpdateOrderStatusArguments(
      orderId: json['orderId'] as String,
      status: $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown),
      cashPayment: (json['cashPayment'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$UpdateOrderStatusArgumentsToJson(
    UpdateOrderStatusArguments instance) {
  final val = <String, dynamic>{
    'orderId': instance.orderId,
    'status': _$OrderStatusEnumMap[instance.status]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cashPayment', instance.cashPayment);
  return val;
}

UpdateDriverStatusArguments _$UpdateDriverStatusArgumentsFromJson(
        Map<String, dynamic> json) =>
    UpdateDriverStatusArguments(
      status: $enumDecode(_$DriverStatusEnumMap, json['status'],
          unknownValue: DriverStatus.artemisUnknown),
      fcmId: json['fcmId'] as String?,
    );

Map<String, dynamic> _$UpdateDriverStatusArgumentsToJson(
    UpdateDriverStatusArguments instance) {
  final val = <String, dynamic>{
    'status': _$DriverStatusEnumMap[instance.status]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fcmId', instance.fcmId);
  return val;
}

UpdateDriverFCMIdArguments _$UpdateDriverFCMIdArgumentsFromJson(
        Map<String, dynamic> json) =>
    UpdateDriverFCMIdArguments(
      fcmId: json['fcmId'] as String?,
    );

Map<String, dynamic> _$UpdateDriverFCMIdArgumentsToJson(
    UpdateDriverFCMIdArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fcmId', instance.fcmId);
  return val;
}

UpdateDriverSearchDistanceArguments
    _$UpdateDriverSearchDistanceArgumentsFromJson(Map<String, dynamic> json) =>
        UpdateDriverSearchDistanceArguments(
          distance: json['distance'] as int,
        );

Map<String, dynamic> _$UpdateDriverSearchDistanceArgumentsToJson(
        UpdateDriverSearchDistanceArguments instance) =>
    <String, dynamic>{
      'distance': instance.distance,
    };