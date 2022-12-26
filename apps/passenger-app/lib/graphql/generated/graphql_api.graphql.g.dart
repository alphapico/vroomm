// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCurrentOrder$Query$Passenger$Media
    _$GetCurrentOrder$Query$Passenger$MediaFromJson(
            Map<String, dynamic> json) =>
        GetCurrentOrder$Query$Passenger$Media()
          ..address = json['address'] as String;

Map<String, dynamic> _$GetCurrentOrder$Query$Passenger$MediaToJson(
        GetCurrentOrder$Query$Passenger$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

GetCurrentOrder$Query$Passenger$Order
    _$GetCurrentOrder$Query$Passenger$OrderFromJson(
            Map<String, dynamic> json) =>
        GetCurrentOrder$Query$Passenger$Order()
          ..id = json['id'] as String
          ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
              unknownValue: OrderStatus.artemisUnknown)
          ..points = (json['points'] as List<dynamic>)
              .map((e) =>
                  CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
              .toList()
          ..driver = json['driver'] == null
              ? null
              : CurrentOrderMixin$Driver.fromJson(
                  json['driver'] as Map<String, dynamic>)
          ..service = CurrentOrderMixin$Service.fromJson(
              json['service'] as Map<String, dynamic>)
          ..directions = (json['directions'] as List<dynamic>?)
              ?.map((e) =>
                  CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
              .toList()
          ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
              json['etaPickup'] as int?)
          ..paidAmount = (json['paidAmount'] as num).toDouble()
          ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
          ..costBest = (json['costBest'] as num).toDouble()
          ..currency = json['currency'] as String
          ..addresses = (json['addresses'] as List<dynamic>)
              .map((e) => e as String)
              .toList()
          ..waitMinutes = json['waitMinutes'] as int
          ..startTimestamp = fromGraphQLTimestampNullableToDartDateTimeNullable(
              json['startTimestamp'] as int?)
          ..durationBest = json['durationBest'] as int;

Map<String, dynamic> _$GetCurrentOrder$Query$Passenger$OrderToJson(
    GetCurrentOrder$Query$Passenger$Order instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'status': _$OrderStatusEnumMap[instance.status]!,
    'points': instance.points.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('driver', instance.driver?.toJson());
  val['service'] = instance.service.toJson();
  writeNotNull(
      'directions', instance.directions?.map((e) => e.toJson()).toList());
  writeNotNull('etaPickup',
      fromDartDateTimeNullableToGraphQLTimestampNullable(instance.etaPickup));
  val['paidAmount'] = instance.paidAmount;
  val['costAfterCoupon'] = instance.costAfterCoupon;
  val['costBest'] = instance.costBest;
  val['currency'] = instance.currency;
  val['addresses'] = instance.addresses;
  val['waitMinutes'] = instance.waitMinutes;
  writeNotNull(
      'startTimestamp',
      fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.startTimestamp));
  val['durationBest'] = instance.durationBest;
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

GetCurrentOrder$Query$Passenger$BookedOrders$PassengerOrdersCountAggregate
    _$GetCurrentOrder$Query$Passenger$BookedOrders$PassengerOrdersCountAggregateFromJson(
            Map<String, dynamic> json) =>
        GetCurrentOrder$Query$Passenger$BookedOrders$PassengerOrdersCountAggregate()
          ..id = json['id'] as int?;

Map<String, dynamic>
    _$GetCurrentOrder$Query$Passenger$BookedOrders$PassengerOrdersCountAggregateToJson(
        GetCurrentOrder$Query$Passenger$BookedOrders$PassengerOrdersCountAggregate
            instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}

GetCurrentOrder$Query$Passenger$BookedOrders
    _$GetCurrentOrder$Query$Passenger$BookedOrdersFromJson(
            Map<String, dynamic> json) =>
        GetCurrentOrder$Query$Passenger$BookedOrders()
          ..count = json['count'] == null
              ? null
              : GetCurrentOrder$Query$Passenger$BookedOrders$PassengerOrdersCountAggregate
                  .fromJson(json['count'] as Map<String, dynamic>);

Map<String, dynamic> _$GetCurrentOrder$Query$Passenger$BookedOrdersToJson(
    GetCurrentOrder$Query$Passenger$BookedOrders instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count?.toJson());
  return val;
}

GetCurrentOrder$Query$Passenger _$GetCurrentOrder$Query$PassengerFromJson(
        Map<String, dynamic> json) =>
    GetCurrentOrder$Query$Passenger()
      ..id = json['id'] as String
      ..mobileNumber = json['mobileNumber'] as String
      ..firstName = json['firstName'] as String?
      ..lastName = json['lastName'] as String?
      ..gender = $enumDecodeNullable(_$GenderEnumMap, json['gender'],
          unknownValue: Gender.artemisUnknown)
      ..email = json['email'] as String?
      ..media = json['media'] == null
          ? null
          : GetCurrentOrder$Query$Passenger$Media.fromJson(
              json['media'] as Map<String, dynamic>)
      ..orders = (json['orders'] as List<dynamic>)
          .map((e) => GetCurrentOrder$Query$Passenger$Order.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..bookedOrders = (json['bookedOrders'] as List<dynamic>)
          .map((e) => GetCurrentOrder$Query$Passenger$BookedOrders.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetCurrentOrder$Query$PassengerToJson(
    GetCurrentOrder$Query$Passenger instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'mobileNumber': instance.mobileNumber,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('gender', _$GenderEnumMap[instance.gender]);
  writeNotNull('email', instance.email);
  writeNotNull('media', instance.media?.toJson());
  val['orders'] = instance.orders.map((e) => e.toJson()).toList();
  val['bookedOrders'] = instance.bookedOrders.map((e) => e.toJson()).toList();
  return val;
}

const _$GenderEnumMap = {
  Gender.male: 'Male',
  Gender.female: 'Female',
  Gender.unknown: 'Unknown',
  Gender.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

GetCurrentOrder$Query$Point _$GetCurrentOrder$Query$PointFromJson(
        Map<String, dynamic> json) =>
    GetCurrentOrder$Query$Point()
      ..lat = (json['lat'] as num).toDouble()
      ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$GetCurrentOrder$Query$PointToJson(
        GetCurrentOrder$Query$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

GetCurrentOrder$Query _$GetCurrentOrder$QueryFromJson(
        Map<String, dynamic> json) =>
    GetCurrentOrder$Query()
      ..passenger = json['passenger'] == null
          ? null
          : GetCurrentOrder$Query$Passenger.fromJson(
              json['passenger'] as Map<String, dynamic>)
      ..requireUpdate = $enumDecode(
          _$VersionStatusEnumMap, json['requireUpdate'],
          unknownValue: VersionStatus.artemisUnknown)
      ..getCurrentOrderDriverLocation = json['getCurrentOrderDriverLocation'] ==
              null
          ? null
          : GetCurrentOrder$Query$Point.fromJson(
              json['getCurrentOrderDriverLocation'] as Map<String, dynamic>);

Map<String, dynamic> _$GetCurrentOrder$QueryToJson(
    GetCurrentOrder$Query instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('passenger', instance.passenger?.toJson());
  val['requireUpdate'] = _$VersionStatusEnumMap[instance.requireUpdate]!;
  writeNotNull('getCurrentOrderDriverLocation',
      instance.getCurrentOrderDriverLocation?.toJson());
  return val;
}

const _$VersionStatusEnumMap = {
  VersionStatus.latest: 'Latest',
  VersionStatus.mandatoryUpdate: 'MandatoryUpdate',
  VersionStatus.optionalUpdate: 'OptionalUpdate',
  VersionStatus.artemisUnknown: 'ARTEMIS_UNKNOWN',
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

CurrentOrderMixin$Driver$Media _$CurrentOrderMixin$Driver$MediaFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Driver$Media()..address = json['address'] as String;

Map<String, dynamic> _$CurrentOrderMixin$Driver$MediaToJson(
        CurrentOrderMixin$Driver$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

CurrentOrderMixin$Driver$CarModel _$CurrentOrderMixin$Driver$CarModelFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Driver$CarModel()..name = json['name'] as String;

Map<String, dynamic> _$CurrentOrderMixin$Driver$CarModelToJson(
        CurrentOrderMixin$Driver$CarModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

CurrentOrderMixin$Driver$CarColor _$CurrentOrderMixin$Driver$CarColorFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Driver$CarColor()..name = json['name'] as String;

Map<String, dynamic> _$CurrentOrderMixin$Driver$CarColorToJson(
        CurrentOrderMixin$Driver$CarColor instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

CurrentOrderMixin$Driver _$CurrentOrderMixin$DriverFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Driver()
      ..firstName = json['firstName'] as String?
      ..lastName = json['lastName'] as String?
      ..media = json['media'] == null
          ? null
          : CurrentOrderMixin$Driver$Media.fromJson(
              json['media'] as Map<String, dynamic>)
      ..mobileNumber = json['mobileNumber'] as String
      ..carPlate = json['carPlate'] as String?
      ..car = json['car'] == null
          ? null
          : CurrentOrderMixin$Driver$CarModel.fromJson(
              json['car'] as Map<String, dynamic>)
      ..carColor = json['carColor'] == null
          ? null
          : CurrentOrderMixin$Driver$CarColor.fromJson(
              json['carColor'] as Map<String, dynamic>)
      ..rating = json['rating'] as int?;

Map<String, dynamic> _$CurrentOrderMixin$DriverToJson(
    CurrentOrderMixin$Driver instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('media', instance.media?.toJson());
  val['mobileNumber'] = instance.mobileNumber;
  writeNotNull('carPlate', instance.carPlate);
  writeNotNull('car', instance.car?.toJson());
  writeNotNull('carColor', instance.carColor?.toJson());
  writeNotNull('rating', instance.rating);
  return val;
}

CurrentOrderMixin$Service$Media _$CurrentOrderMixin$Service$MediaFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Service$Media()..address = json['address'] as String;

Map<String, dynamic> _$CurrentOrderMixin$Service$MediaToJson(
        CurrentOrderMixin$Service$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

CurrentOrderMixin$Service _$CurrentOrderMixin$ServiceFromJson(
        Map<String, dynamic> json) =>
    CurrentOrderMixin$Service()
      ..media = CurrentOrderMixin$Service$Media.fromJson(
          json['media'] as Map<String, dynamic>)
      ..name = json['name'] as String
      ..cancellationTotalFee = (json['cancellationTotalFee'] as num).toDouble();

Map<String, dynamic> _$CurrentOrderMixin$ServiceToJson(
        CurrentOrderMixin$Service instance) =>
    <String, dynamic>{
      'media': instance.media.toJson(),
      'name': instance.name,
      'cancellationTotalFee': instance.cancellationTotalFee,
    };

CreateOrder$Mutation$Order _$CreateOrder$Mutation$OrderFromJson(
        Map<String, dynamic> json) =>
    CreateOrder$Mutation$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..driver = json['driver'] == null
          ? null
          : CurrentOrderMixin$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..service = CurrentOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..directions = (json['directions'] as List<dynamic>?)
          ?.map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..costBest = (json['costBest'] as num).toDouble()
      ..currency = json['currency'] as String
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..waitMinutes = json['waitMinutes'] as int
      ..startTimestamp = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['startTimestamp'] as int?)
      ..durationBest = json['durationBest'] as int;

Map<String, dynamic> _$CreateOrder$Mutation$OrderToJson(
    CreateOrder$Mutation$Order instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'status': _$OrderStatusEnumMap[instance.status]!,
    'points': instance.points.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('driver', instance.driver?.toJson());
  val['service'] = instance.service.toJson();
  writeNotNull(
      'directions', instance.directions?.map((e) => e.toJson()).toList());
  writeNotNull('etaPickup',
      fromDartDateTimeNullableToGraphQLTimestampNullable(instance.etaPickup));
  val['paidAmount'] = instance.paidAmount;
  val['costAfterCoupon'] = instance.costAfterCoupon;
  val['costBest'] = instance.costBest;
  val['currency'] = instance.currency;
  val['addresses'] = instance.addresses;
  val['waitMinutes'] = instance.waitMinutes;
  writeNotNull(
      'startTimestamp',
      fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.startTimestamp));
  val['durationBest'] = instance.durationBest;
  return val;
}

CreateOrder$Mutation$Passenger _$CreateOrder$Mutation$PassengerFromJson(
        Map<String, dynamic> json) =>
    CreateOrder$Mutation$Passenger()..id = json['id'] as String;

Map<String, dynamic> _$CreateOrder$Mutation$PassengerToJson(
        CreateOrder$Mutation$Passenger instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

CreateOrder$Mutation _$CreateOrder$MutationFromJson(
        Map<String, dynamic> json) =>
    CreateOrder$Mutation()
      ..createOrder = CreateOrder$Mutation$Order.fromJson(
          json['createOrder'] as Map<String, dynamic>)
      ..updateOnePassenger = CreateOrder$Mutation$Passenger.fromJson(
          json['updateOnePassenger'] as Map<String, dynamic>);

Map<String, dynamic> _$CreateOrder$MutationToJson(
        CreateOrder$Mutation instance) =>
    <String, dynamic>{
      'createOrder': instance.createOrder.toJson(),
      'updateOnePassenger': instance.updateOnePassenger.toJson(),
    };

CreateOrderInput _$CreateOrderInputFromJson(Map<String, dynamic> json) =>
    CreateOrderInput(
      serviceId: json['serviceId'] as int,
      points: (json['points'] as List<dynamic>)
          .map((e) => PointInput.fromJson(e as Map<String, dynamic>))
          .toList(),
      addresses:
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList(),
      intervalMinutes: json['intervalMinutes'] as int,
      twoWay: json['twoWay'] as bool?,
      optionIds: (json['optionIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      couponCode: json['couponCode'] as String?,
    );

Map<String, dynamic> _$CreateOrderInputToJson(CreateOrderInput instance) {
  final val = <String, dynamic>{
    'serviceId': instance.serviceId,
    'points': instance.points.map((e) => e.toJson()).toList(),
    'addresses': instance.addresses,
    'intervalMinutes': instance.intervalMinutes,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('twoWay', instance.twoWay);
  writeNotNull('optionIds', instance.optionIds);
  writeNotNull('couponCode', instance.couponCode);
  return val;
}

PointInput _$PointInputFromJson(Map<String, dynamic> json) => PointInput(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$PointInputToJson(PointInput instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

CancelOrder$Mutation$Order _$CancelOrder$Mutation$OrderFromJson(
        Map<String, dynamic> json) =>
    CancelOrder$Mutation$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..driver = json['driver'] == null
          ? null
          : CurrentOrderMixin$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..service = CurrentOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..directions = (json['directions'] as List<dynamic>?)
          ?.map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..costBest = (json['costBest'] as num).toDouble()
      ..currency = json['currency'] as String
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..waitMinutes = json['waitMinutes'] as int
      ..startTimestamp = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['startTimestamp'] as int?)
      ..durationBest = json['durationBest'] as int;

Map<String, dynamic> _$CancelOrder$Mutation$OrderToJson(
    CancelOrder$Mutation$Order instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'status': _$OrderStatusEnumMap[instance.status]!,
    'points': instance.points.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('driver', instance.driver?.toJson());
  val['service'] = instance.service.toJson();
  writeNotNull(
      'directions', instance.directions?.map((e) => e.toJson()).toList());
  writeNotNull('etaPickup',
      fromDartDateTimeNullableToGraphQLTimestampNullable(instance.etaPickup));
  val['paidAmount'] = instance.paidAmount;
  val['costAfterCoupon'] = instance.costAfterCoupon;
  val['costBest'] = instance.costBest;
  val['currency'] = instance.currency;
  val['addresses'] = instance.addresses;
  val['waitMinutes'] = instance.waitMinutes;
  writeNotNull(
      'startTimestamp',
      fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.startTimestamp));
  val['durationBest'] = instance.durationBest;
  return val;
}

CancelOrder$Mutation _$CancelOrder$MutationFromJson(
        Map<String, dynamic> json) =>
    CancelOrder$Mutation()
      ..cancelOrder = CancelOrder$Mutation$Order.fromJson(
          json['cancelOrder'] as Map<String, dynamic>);

Map<String, dynamic> _$CancelOrder$MutationToJson(
        CancelOrder$Mutation instance) =>
    <String, dynamic>{
      'cancelOrder': instance.cancelOrder.toJson(),
    };

UpdateOrder$Mutation$Order _$UpdateOrder$Mutation$OrderFromJson(
        Map<String, dynamic> json) =>
    UpdateOrder$Mutation$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..driver = json['driver'] == null
          ? null
          : CurrentOrderMixin$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..service = CurrentOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..directions = (json['directions'] as List<dynamic>?)
          ?.map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..costBest = (json['costBest'] as num).toDouble()
      ..currency = json['currency'] as String
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..waitMinutes = json['waitMinutes'] as int
      ..startTimestamp = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['startTimestamp'] as int?)
      ..durationBest = json['durationBest'] as int;

Map<String, dynamic> _$UpdateOrder$Mutation$OrderToJson(
    UpdateOrder$Mutation$Order instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'status': _$OrderStatusEnumMap[instance.status]!,
    'points': instance.points.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('driver', instance.driver?.toJson());
  val['service'] = instance.service.toJson();
  writeNotNull(
      'directions', instance.directions?.map((e) => e.toJson()).toList());
  writeNotNull('etaPickup',
      fromDartDateTimeNullableToGraphQLTimestampNullable(instance.etaPickup));
  val['paidAmount'] = instance.paidAmount;
  val['costAfterCoupon'] = instance.costAfterCoupon;
  val['costBest'] = instance.costBest;
  val['currency'] = instance.currency;
  val['addresses'] = instance.addresses;
  val['waitMinutes'] = instance.waitMinutes;
  writeNotNull(
      'startTimestamp',
      fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.startTimestamp));
  val['durationBest'] = instance.durationBest;
  return val;
}

UpdateOrder$Mutation _$UpdateOrder$MutationFromJson(
        Map<String, dynamic> json) =>
    UpdateOrder$Mutation()
      ..updateOneOrder = UpdateOrder$Mutation$Order.fromJson(
          json['updateOneOrder'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdateOrder$MutationToJson(
        UpdateOrder$Mutation instance) =>
    <String, dynamic>{
      'updateOneOrder': instance.updateOneOrder.toJson(),
    };

UpdateOrderInput _$UpdateOrderInputFromJson(Map<String, dynamic> json) =>
    UpdateOrderInput(
      status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown),
      tipAmount: (json['tipAmount'] as num?)?.toDouble(),
      waitMinutes: json['waitMinutes'] as int?,
      couponCode: json['couponCode'] as String?,
    );

Map<String, dynamic> _$UpdateOrderInputToJson(UpdateOrderInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', _$OrderStatusEnumMap[instance.status]);
  writeNotNull('tipAmount', instance.tipAmount);
  writeNotNull('waitMinutes', instance.waitMinutes);
  writeNotNull('couponCode', instance.couponCode);
  return val;
}

UpdatedOrder$Subscription$Order$Point
    _$UpdatedOrder$Subscription$Order$PointFromJson(
            Map<String, dynamic> json) =>
        UpdatedOrder$Subscription$Order$Point()
          ..lat = (json['lat'] as num).toDouble()
          ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$UpdatedOrder$Subscription$Order$PointToJson(
        UpdatedOrder$Subscription$Order$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

UpdatedOrder$Subscription$Order$Driver$Media
    _$UpdatedOrder$Subscription$Order$Driver$MediaFromJson(
            Map<String, dynamic> json) =>
        UpdatedOrder$Subscription$Order$Driver$Media()
          ..address = json['address'] as String;

Map<String, dynamic> _$UpdatedOrder$Subscription$Order$Driver$MediaToJson(
        UpdatedOrder$Subscription$Order$Driver$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

UpdatedOrder$Subscription$Order$Driver$CarModel
    _$UpdatedOrder$Subscription$Order$Driver$CarModelFromJson(
            Map<String, dynamic> json) =>
        UpdatedOrder$Subscription$Order$Driver$CarModel()
          ..name = json['name'] as String;

Map<String, dynamic> _$UpdatedOrder$Subscription$Order$Driver$CarModelToJson(
        UpdatedOrder$Subscription$Order$Driver$CarModel instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

UpdatedOrder$Subscription$Order$Driver$CarColor
    _$UpdatedOrder$Subscription$Order$Driver$CarColorFromJson(
            Map<String, dynamic> json) =>
        UpdatedOrder$Subscription$Order$Driver$CarColor()
          ..name = json['name'] as String;

Map<String, dynamic> _$UpdatedOrder$Subscription$Order$Driver$CarColorToJson(
        UpdatedOrder$Subscription$Order$Driver$CarColor instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

UpdatedOrder$Subscription$Order$Driver
    _$UpdatedOrder$Subscription$Order$DriverFromJson(
            Map<String, dynamic> json) =>
        UpdatedOrder$Subscription$Order$Driver()
          ..firstName = json['firstName'] as String?
          ..lastName = json['lastName'] as String?
          ..media = json['media'] == null
              ? null
              : UpdatedOrder$Subscription$Order$Driver$Media.fromJson(
                  json['media'] as Map<String, dynamic>)
          ..mobileNumber = json['mobileNumber'] as String
          ..carPlate = json['carPlate'] as String?
          ..car = json['car'] == null
              ? null
              : UpdatedOrder$Subscription$Order$Driver$CarModel.fromJson(
                  json['car'] as Map<String, dynamic>)
          ..carColor = json['carColor'] == null
              ? null
              : UpdatedOrder$Subscription$Order$Driver$CarColor.fromJson(
                  json['carColor'] as Map<String, dynamic>)
          ..rating = json['rating'] as int?;

Map<String, dynamic> _$UpdatedOrder$Subscription$Order$DriverToJson(
    UpdatedOrder$Subscription$Order$Driver instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('media', instance.media?.toJson());
  val['mobileNumber'] = instance.mobileNumber;
  writeNotNull('carPlate', instance.carPlate);
  writeNotNull('car', instance.car?.toJson());
  writeNotNull('carColor', instance.carColor?.toJson());
  writeNotNull('rating', instance.rating);
  return val;
}

UpdatedOrder$Subscription$Order$Service$Media
    _$UpdatedOrder$Subscription$Order$Service$MediaFromJson(
            Map<String, dynamic> json) =>
        UpdatedOrder$Subscription$Order$Service$Media()
          ..address = json['address'] as String;

Map<String, dynamic> _$UpdatedOrder$Subscription$Order$Service$MediaToJson(
        UpdatedOrder$Subscription$Order$Service$Media instance) =>
    <String, dynamic>{
      'address': instance.address,
    };

UpdatedOrder$Subscription$Order$Service
    _$UpdatedOrder$Subscription$Order$ServiceFromJson(
            Map<String, dynamic> json) =>
        UpdatedOrder$Subscription$Order$Service()
          ..media = UpdatedOrder$Subscription$Order$Service$Media.fromJson(
              json['media'] as Map<String, dynamic>)
          ..name = json['name'] as String
          ..cancellationTotalFee =
              (json['cancellationTotalFee'] as num).toDouble();

Map<String, dynamic> _$UpdatedOrder$Subscription$Order$ServiceToJson(
        UpdatedOrder$Subscription$Order$Service instance) =>
    <String, dynamic>{
      'media': instance.media.toJson(),
      'name': instance.name,
      'cancellationTotalFee': instance.cancellationTotalFee,
    };

UpdatedOrder$Subscription$Order _$UpdatedOrder$Subscription$OrderFromJson(
        Map<String, dynamic> json) =>
    UpdatedOrder$Subscription$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..points = (json['points'] as List<dynamic>)
          .map((e) => UpdatedOrder$Subscription$Order$Point.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..driver = json['driver'] == null
          ? null
          : UpdatedOrder$Subscription$Order$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..directions = (json['directions'] as List<dynamic>?)
          ?.map((e) => UpdatedOrder$Subscription$Order$Point.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..service = UpdatedOrder$Subscription$Order$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..durationBest = json['durationBest'] as int
      ..startTimestamp = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['startTimestamp'] as int?)
      ..costBest = (json['costBest'] as num).toDouble()
      ..currency = json['currency'] as String
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..waitMinutes = json['waitMinutes'] as int;

Map<String, dynamic> _$UpdatedOrder$Subscription$OrderToJson(
    UpdatedOrder$Subscription$Order instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'status': _$OrderStatusEnumMap[instance.status]!,
    'points': instance.points.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('driver', instance.driver?.toJson());
  writeNotNull(
      'directions', instance.directions?.map((e) => e.toJson()).toList());
  val['service'] = instance.service.toJson();
  writeNotNull('etaPickup',
      fromDartDateTimeNullableToGraphQLTimestampNullable(instance.etaPickup));
  val['paidAmount'] = instance.paidAmount;
  val['costAfterCoupon'] = instance.costAfterCoupon;
  val['durationBest'] = instance.durationBest;
  writeNotNull(
      'startTimestamp',
      fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.startTimestamp));
  val['costBest'] = instance.costBest;
  val['currency'] = instance.currency;
  val['addresses'] = instance.addresses;
  val['waitMinutes'] = instance.waitMinutes;
  return val;
}

UpdatedOrder$Subscription _$UpdatedOrder$SubscriptionFromJson(
        Map<String, dynamic> json) =>
    UpdatedOrder$Subscription()
      ..orderUpdated = UpdatedOrder$Subscription$Order.fromJson(
          json['orderUpdated'] as Map<String, dynamic>);

Map<String, dynamic> _$UpdatedOrder$SubscriptionToJson(
        UpdatedOrder$Subscription instance) =>
    <String, dynamic>{
      'orderUpdated': instance.orderUpdated.toJson(),
    };

DriverLocationUpdated$Subscription$Point
    _$DriverLocationUpdated$Subscription$PointFromJson(
            Map<String, dynamic> json) =>
        DriverLocationUpdated$Subscription$Point()
          ..lat = (json['lat'] as num).toDouble()
          ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$DriverLocationUpdated$Subscription$PointToJson(
        DriverLocationUpdated$Subscription$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

DriverLocationUpdated$Subscription _$DriverLocationUpdated$SubscriptionFromJson(
        Map<String, dynamic> json) =>
    DriverLocationUpdated$Subscription()
      ..driverLocationUpdated =
          DriverLocationUpdated$Subscription$Point.fromJson(
              json['driverLocationUpdated'] as Map<String, dynamic>);

Map<String, dynamic> _$DriverLocationUpdated$SubscriptionToJson(
        DriverLocationUpdated$Subscription instance) =>
    <String, dynamic>{
      'driverLocationUpdated': instance.driverLocationUpdated.toJson(),
    };

SubmitFeedback$Mutation$Order _$SubmitFeedback$Mutation$OrderFromJson(
        Map<String, dynamic> json) =>
    SubmitFeedback$Mutation$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..driver = json['driver'] == null
          ? null
          : CurrentOrderMixin$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..service = CurrentOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..directions = (json['directions'] as List<dynamic>?)
          ?.map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..costBest = (json['costBest'] as num).toDouble()
      ..currency = json['currency'] as String
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..waitMinutes = json['waitMinutes'] as int
      ..startTimestamp = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['startTimestamp'] as int?)
      ..durationBest = json['durationBest'] as int;

Map<String, dynamic> _$SubmitFeedback$Mutation$OrderToJson(
    SubmitFeedback$Mutation$Order instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'status': _$OrderStatusEnumMap[instance.status]!,
    'points': instance.points.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('driver', instance.driver?.toJson());
  val['service'] = instance.service.toJson();
  writeNotNull(
      'directions', instance.directions?.map((e) => e.toJson()).toList());
  writeNotNull('etaPickup',
      fromDartDateTimeNullableToGraphQLTimestampNullable(instance.etaPickup));
  val['paidAmount'] = instance.paidAmount;
  val['costAfterCoupon'] = instance.costAfterCoupon;
  val['costBest'] = instance.costBest;
  val['currency'] = instance.currency;
  val['addresses'] = instance.addresses;
  val['waitMinutes'] = instance.waitMinutes;
  writeNotNull(
      'startTimestamp',
      fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.startTimestamp));
  val['durationBest'] = instance.durationBest;
  return val;
}

SubmitFeedback$Mutation _$SubmitFeedback$MutationFromJson(
        Map<String, dynamic> json) =>
    SubmitFeedback$Mutation()
      ..submitReview = SubmitFeedback$Mutation$Order.fromJson(
          json['submitReview'] as Map<String, dynamic>);

Map<String, dynamic> _$SubmitFeedback$MutationToJson(
        SubmitFeedback$Mutation instance) =>
    <String, dynamic>{
      'submitReview': instance.submitReview.toJson(),
    };

GetDriversLocation$Query$Point _$GetDriversLocation$Query$PointFromJson(
        Map<String, dynamic> json) =>
    GetDriversLocation$Query$Point()
      ..lat = (json['lat'] as num).toDouble()
      ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$GetDriversLocation$Query$PointToJson(
        GetDriversLocation$Query$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

GetDriversLocation$Query _$GetDriversLocation$QueryFromJson(
        Map<String, dynamic> json) =>
    GetDriversLocation$Query()
      ..getDriversLocation = (json['getDriversLocation'] as List<dynamic>)
          .map((e) => GetDriversLocation$Query$Point.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetDriversLocation$QueryToJson(
        GetDriversLocation$Query instance) =>
    <String, dynamic>{
      'getDriversLocation':
          instance.getDriversLocation.map((e) => e.toJson()).toList(),
    };

GetReviewParameters$Query$FeedbackParameter
    _$GetReviewParameters$Query$FeedbackParameterFromJson(
            Map<String, dynamic> json) =>
        GetReviewParameters$Query$FeedbackParameter()
          ..id = json['id'] as String
          ..title = json['title'] as String
          ..isGood = json['isGood'] as bool;

Map<String, dynamic> _$GetReviewParameters$Query$FeedbackParameterToJson(
        GetReviewParameters$Query$FeedbackParameter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isGood': instance.isGood,
    };

GetReviewParameters$Query _$GetReviewParameters$QueryFromJson(
        Map<String, dynamic> json) =>
    GetReviewParameters$Query()
      ..feedbackParameters = (json['feedbackParameters'] as List<dynamic>)
          .map((e) => GetReviewParameters$Query$FeedbackParameter.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetReviewParameters$QueryToJson(
        GetReviewParameters$Query instance) =>
    <String, dynamic>{
      'feedbackParameters':
          instance.feedbackParameters.map((e) => e.toJson()).toList(),
    };

GetFare$Query$CalculateFareDTO$Point
    _$GetFare$Query$CalculateFareDTO$PointFromJson(Map<String, dynamic> json) =>
        GetFare$Query$CalculateFareDTO$Point()
          ..lat = (json['lat'] as num).toDouble()
          ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$GetFare$Query$CalculateFareDTO$PointToJson(
        GetFare$Query$CalculateFareDTO$Point instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

GetFare$Query$CalculateFareDTO$ServiceCategory$Service$Media
    _$GetFare$Query$CalculateFareDTO$ServiceCategory$Service$MediaFromJson(
            Map<String, dynamic> json) =>
        GetFare$Query$CalculateFareDTO$ServiceCategory$Service$Media()
          ..address = json['address'] as String;

Map<String, dynamic>
    _$GetFare$Query$CalculateFareDTO$ServiceCategory$Service$MediaToJson(
            GetFare$Query$CalculateFareDTO$ServiceCategory$Service$Media
                instance) =>
        <String, dynamic>{
          'address': instance.address,
        };

GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOption
    _$GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOptionFromJson(
            Map<String, dynamic> json) =>
        GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOption()
          ..id = json['id'] as String
          ..name = json['name'] as String
          ..type = $enumDecode(_$ServiceOptionTypeEnumMap, json['type'],
              unknownValue: ServiceOptionType.artemisUnknown)
          ..additionalFee = (json['additionalFee'] as num?)?.toDouble()
          ..icon = $enumDecode(_$ServiceOptionIconEnumMap, json['icon'],
              unknownValue: ServiceOptionIcon.artemisUnknown);

Map<String, dynamic>
    _$GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOptionToJson(
        GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOption
            instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
    'type': _$ServiceOptionTypeEnumMap[instance.type]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('additionalFee', instance.additionalFee);
  val['icon'] = _$ServiceOptionIconEnumMap[instance.icon]!;
  return val;
}

const _$ServiceOptionTypeEnumMap = {
  ServiceOptionType.free: 'Free',
  ServiceOptionType.paid: 'Paid',
  ServiceOptionType.twoWay: 'TwoWay',
  ServiceOptionType.artemisUnknown: 'ARTEMIS_UNKNOWN',
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

GetFare$Query$CalculateFareDTO$ServiceCategory$Service
    _$GetFare$Query$CalculateFareDTO$ServiceCategory$ServiceFromJson(
            Map<String, dynamic> json) =>
        GetFare$Query$CalculateFareDTO$ServiceCategory$Service()
          ..id = json['id'] as String
          ..name = json['name'] as String
          ..description = json['description'] as String?
          ..personCapacity = json['personCapacity'] as int?
          ..prepayPercent = json['prepayPercent'] as int
          ..twoWayAvailable = json['twoWayAvailable'] as bool
          ..media = GetFare$Query$CalculateFareDTO$ServiceCategory$Service$Media
              .fromJson(json['media'] as Map<String, dynamic>)
          ..options = (json['options'] as List<dynamic>)
              .map((e) =>
                  GetFare$Query$CalculateFareDTO$ServiceCategory$Service$ServiceOption
                      .fromJson(e as Map<String, dynamic>))
              .toList()
          ..cost = (json['cost'] as num).toDouble()
          ..costAfterCoupon = (json['costAfterCoupon'] as num?)?.toDouble();

Map<String, dynamic>
    _$GetFare$Query$CalculateFareDTO$ServiceCategory$ServiceToJson(
        GetFare$Query$CalculateFareDTO$ServiceCategory$Service instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('personCapacity', instance.personCapacity);
  val['prepayPercent'] = instance.prepayPercent;
  val['twoWayAvailable'] = instance.twoWayAvailable;
  val['media'] = instance.media.toJson();
  val['options'] = instance.options.map((e) => e.toJson()).toList();
  val['cost'] = instance.cost;
  writeNotNull('costAfterCoupon', instance.costAfterCoupon);
  return val;
}

GetFare$Query$CalculateFareDTO$ServiceCategory
    _$GetFare$Query$CalculateFareDTO$ServiceCategoryFromJson(
            Map<String, dynamic> json) =>
        GetFare$Query$CalculateFareDTO$ServiceCategory()
          ..id = json['id'] as String
          ..name = json['name'] as String
          ..services = (json['services'] as List<dynamic>)
              .map((e) => GetFare$Query$CalculateFareDTO$ServiceCategory$Service
                  .fromJson(e as Map<String, dynamic>))
              .toList();

Map<String, dynamic> _$GetFare$Query$CalculateFareDTO$ServiceCategoryToJson(
        GetFare$Query$CalculateFareDTO$ServiceCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'services': instance.services.map((e) => e.toJson()).toList(),
    };

GetFare$Query$CalculateFareDTO _$GetFare$Query$CalculateFareDTOFromJson(
        Map<String, dynamic> json) =>
    GetFare$Query$CalculateFareDTO()
      ..distance = (json['distance'] as num).toDouble()
      ..duration = (json['duration'] as num).toDouble()
      ..currency = json['currency'] as String
      ..directions = (json['directions'] as List<dynamic>)
          .map((e) => GetFare$Query$CalculateFareDTO$Point.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..services = (json['services'] as List<dynamic>)
          .map((e) => GetFare$Query$CalculateFareDTO$ServiceCategory.fromJson(
              e as Map<String, dynamic>))
          .toList()
      ..error = $enumDecodeNullable(_$CalculateFareErrorEnumMap, json['error'],
          unknownValue: CalculateFareError.artemisUnknown);

Map<String, dynamic> _$GetFare$Query$CalculateFareDTOToJson(
    GetFare$Query$CalculateFareDTO instance) {
  final val = <String, dynamic>{
    'distance': instance.distance,
    'duration': instance.duration,
    'currency': instance.currency,
    'directions': instance.directions.map((e) => e.toJson()).toList(),
    'services': instance.services.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error', _$CalculateFareErrorEnumMap[instance.error]);
  return val;
}

const _$CalculateFareErrorEnumMap = {
  CalculateFareError.regionUnsupported: 'RegionUnsupported',
  CalculateFareError.noServiceInRegion: 'NoServiceInRegion',
  CalculateFareError.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

GetFare$Query _$GetFare$QueryFromJson(Map<String, dynamic> json) =>
    GetFare$Query()
      ..getFare = GetFare$Query$CalculateFareDTO.fromJson(
          json['getFare'] as Map<String, dynamic>);

Map<String, dynamic> _$GetFare$QueryToJson(GetFare$Query instance) =>
    <String, dynamic>{
      'getFare': instance.getFare.toJson(),
    };

ApplyCoupon$Mutation$Order _$ApplyCoupon$Mutation$OrderFromJson(
        Map<String, dynamic> json) =>
    ApplyCoupon$Mutation$Order()
      ..id = json['id'] as String
      ..status = $enumDecode(_$OrderStatusEnumMap, json['status'],
          unknownValue: OrderStatus.artemisUnknown)
      ..points = (json['points'] as List<dynamic>)
          .map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..driver = json['driver'] == null
          ? null
          : CurrentOrderMixin$Driver.fromJson(
              json['driver'] as Map<String, dynamic>)
      ..service = CurrentOrderMixin$Service.fromJson(
          json['service'] as Map<String, dynamic>)
      ..directions = (json['directions'] as List<dynamic>?)
          ?.map((e) =>
              CurrentOrderMixin$Point.fromJson(e as Map<String, dynamic>))
          .toList()
      ..etaPickup = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['etaPickup'] as int?)
      ..paidAmount = (json['paidAmount'] as num).toDouble()
      ..costAfterCoupon = (json['costAfterCoupon'] as num).toDouble()
      ..costBest = (json['costBest'] as num).toDouble()
      ..currency = json['currency'] as String
      ..addresses =
          (json['addresses'] as List<dynamic>).map((e) => e as String).toList()
      ..waitMinutes = json['waitMinutes'] as int
      ..startTimestamp = fromGraphQLTimestampNullableToDartDateTimeNullable(
          json['startTimestamp'] as int?)
      ..durationBest = json['durationBest'] as int;

Map<String, dynamic> _$ApplyCoupon$Mutation$OrderToJson(
    ApplyCoupon$Mutation$Order instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'status': _$OrderStatusEnumMap[instance.status]!,
    'points': instance.points.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('driver', instance.driver?.toJson());
  val['service'] = instance.service.toJson();
  writeNotNull(
      'directions', instance.directions?.map((e) => e.toJson()).toList());
  writeNotNull('etaPickup',
      fromDartDateTimeNullableToGraphQLTimestampNullable(instance.etaPickup));
  val['paidAmount'] = instance.paidAmount;
  val['costAfterCoupon'] = instance.costAfterCoupon;
  val['costBest'] = instance.costBest;
  val['currency'] = instance.currency;
  val['addresses'] = instance.addresses;
  val['waitMinutes'] = instance.waitMinutes;
  writeNotNull(
      'startTimestamp',
      fromDartDateTimeNullableToGraphQLTimestampNullable(
          instance.startTimestamp));
  val['durationBest'] = instance.durationBest;
  return val;
}

ApplyCoupon$Mutation _$ApplyCoupon$MutationFromJson(
        Map<String, dynamic> json) =>
    ApplyCoupon$Mutation()
      ..applyCoupon = ApplyCoupon$Mutation$Order.fromJson(
          json['applyCoupon'] as Map<String, dynamic>);

Map<String, dynamic> _$ApplyCoupon$MutationToJson(
        ApplyCoupon$Mutation instance) =>
    <String, dynamic>{
      'applyCoupon': instance.applyCoupon.toJson(),
    };

GetCurrentOrderArguments _$GetCurrentOrderArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetCurrentOrderArguments(
      versionCode: json['versionCode'] as int,
    );

Map<String, dynamic> _$GetCurrentOrderArgumentsToJson(
        GetCurrentOrderArguments instance) =>
    <String, dynamic>{
      'versionCode': instance.versionCode,
    };

CreateOrderArguments _$CreateOrderArgumentsFromJson(
        Map<String, dynamic> json) =>
    CreateOrderArguments(
      input: CreateOrderInput.fromJson(json['input'] as Map<String, dynamic>),
      notificationPlayerId: json['notificationPlayerId'] as String,
    );

Map<String, dynamic> _$CreateOrderArgumentsToJson(
        CreateOrderArguments instance) =>
    <String, dynamic>{
      'input': instance.input.toJson(),
      'notificationPlayerId': instance.notificationPlayerId,
    };

UpdateOrderArguments _$UpdateOrderArgumentsFromJson(
        Map<String, dynamic> json) =>
    UpdateOrderArguments(
      id: json['id'] as String,
      update: UpdateOrderInput.fromJson(json['update'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateOrderArgumentsToJson(
        UpdateOrderArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'update': instance.update.toJson(),
    };

DriverLocationUpdatedArguments _$DriverLocationUpdatedArgumentsFromJson(
        Map<String, dynamic> json) =>
    DriverLocationUpdatedArguments(
      driverId: json['driverId'] as String,
    );

Map<String, dynamic> _$DriverLocationUpdatedArgumentsToJson(
        DriverLocationUpdatedArguments instance) =>
    <String, dynamic>{
      'driverId': instance.driverId,
    };

SubmitFeedbackArguments _$SubmitFeedbackArgumentsFromJson(
        Map<String, dynamic> json) =>
    SubmitFeedbackArguments(
      score: json['score'] as int,
      description: json['description'] as String,
      orderId: json['orderId'] as String,
      parameterIds: (json['parameterIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SubmitFeedbackArgumentsToJson(
        SubmitFeedbackArguments instance) =>
    <String, dynamic>{
      'score': instance.score,
      'description': instance.description,
      'orderId': instance.orderId,
      'parameterIds': instance.parameterIds,
    };

GetDriversLocationArguments _$GetDriversLocationArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetDriversLocationArguments(
      point: json['point'] == null
          ? null
          : PointInput.fromJson(json['point'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetDriversLocationArgumentsToJson(
    GetDriversLocationArguments instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('point', instance.point?.toJson());
  return val;
}

GetFareArguments _$GetFareArgumentsFromJson(Map<String, dynamic> json) =>
    GetFareArguments(
      points: (json['points'] as List<dynamic>)
          .map((e) => PointInput.fromJson(e as Map<String, dynamic>))
          .toList(),
      couponCode: json['couponCode'] as String?,
      selectedOptionIds: (json['selectedOptionIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GetFareArgumentsToJson(GetFareArguments instance) {
  final val = <String, dynamic>{
    'points': instance.points.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('couponCode', instance.couponCode);
  writeNotNull('selectedOptionIds', instance.selectedOptionIds);
  return val;
}

ApplyCouponArguments _$ApplyCouponArgumentsFromJson(
        Map<String, dynamic> json) =>
    ApplyCouponArguments(
      code: json['code'] as String,
    );

Map<String, dynamic> _$ApplyCouponArgumentsToJson(
        ApplyCouponArguments instance) =>
    <String, dynamic>{
      'code': instance.code,
    };
