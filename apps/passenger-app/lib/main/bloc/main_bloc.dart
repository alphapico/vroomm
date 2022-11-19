import 'dart:typed_data';

import 'package:client_shared/components/marker_new.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google;
import 'package:latlong2/latlong.dart';
import '../../location_selection/welcome_card/place_search_sheet_view.dart';
import '../../graphql/generated/graphql_api.graphql.dart';
import 'package:collection/collection.dart';

// Events
abstract class MainBlocEvent {}

class MapMoved extends MainBlocEvent {
  LatLng latlng;

  MapMoved(this.latlng);
}

class ResetState extends MainBlocEvent {}

class DriverLocationUpdatedEvent extends MainBlocEvent {
  PointMixin location;

  DriverLocationUpdatedEvent(this.location);
}

class ShowPreview extends MainBlocEvent {
  List<FullLocation> points;
  List<String> selectedOptions;
  String? couponCode;

  ShowPreview(
      {required this.points, required this.selectedOptions, this.couponCode});
}

class SelectService extends MainBlocEvent {
  GetFare$Query$CalculateFareDTO$ServiceCategory$Service service;

  SelectService(this.service);
}

class ShowPreviewDirections extends MainBlocEvent {
  List<GetFare$Query$CalculateFareDTO$Point> directions;

  ShowPreviewDirections({required this.directions});
}

class SelectBookingTime extends MainBlocEvent {
  DateTime time;

  SelectBookingTime(this.time);
}

class ProfileUpdated extends MainBlocEvent {
  GetCurrentOrder$Query$Passenger profile;
  PointMixin? driverLocation;

  ProfileUpdated({required this.profile, this.driverLocation});
}

class VersionStatusEvent extends MainBlocEvent {
  VersionStatus status;
  VersionStatusEvent(this.status);
}

class CurrentOrderUpdated extends MainBlocEvent {
  CurrentOrderMixin order;
  PointMixin? driverLocation;

  CurrentOrderUpdated(this.order, {this.driverLocation});
}

class SetDriversLocations extends MainBlocEvent {
  List<LatLng> driversLocations;

  SetDriversLocations(this.driversLocations);
}

// States
abstract class MainBlocState {
  List<MarkerDataInterface> markers;
  bool isInteractive;
  int bookedOrdersCount;

  MainBlocState(
      {required this.isInteractive,
      required this.markers,
      this.bookedOrdersCount = 0});
}

class RequireUpdateState extends MainBlocState {
  RequireUpdateState() : super(isInteractive: false, markers: []);
}

class SelectingPoints extends MainBlocState {
  List<FullLocation> points = [];
  List<LatLng> driverLocations = [];
  bool loadDrivers;
  int bookingsCount = 0;

  SelectingPoints(this.points, this.driverLocations, this.loadDrivers,
      {this.bookingsCount = 0})
      : super(
            isInteractive: true,
            markers: driverLocations
                .mapIndexed((index, e) =>
                    MarkerDataDriver(id: index.toString(), position: e))
                .toList());
}

class MainBloc extends Bloc<MainBlocEvent, MainBlocState> {
  MainBloc() : super(SelectingPoints([], [], true)) {
    on<VersionStatusEvent>(((event, emit) => emit(RequireUpdateState())));

    on<MapMoved>((event, emit) {
      if (state is! SelectingPoints) return;
      emit(SelectingPoints((state as SelectingPoints).points, [], true,
          bookingsCount: (state as SelectingPoints).bookingsCount));
    });

    on<ResetState>((event, emit) => emit(SelectingPoints([], [], true)));

    // ShowPreview
    // SelectService
    // ShowPreviewDirections
    // ProfileUpdated
    // CurrentOrderUpdated
    // DriverLocationUpdatedEvent
    // SetDriversLocations
    // DriverLocationUpdatedEvent
    // SetDriversLocations
  }
}

abstract class MarkerDataInterface {
  String id;
  LatLng position;

  MarkerDataInterface({required this.id, required this.position});

  Marker toFlutterMapMarker();

  google.Marker toGoogleMarker(
      Uint8List carIconBytes, Uint8List positionIconBytes);
}

class MarkerDataPosition extends MarkerDataInterface {
  String address;

  MarkerDataPosition(
      {required this.address, required String id, required LatLng position})
      : super(id: id, position: position);

  @override
  google.Marker toGoogleMarker(
      Uint8List carIconBytes, Uint8List positionIconBytes) {
    return google.Marker(
        markerId: google.MarkerId(id),
        position: google.LatLng(position.latitude, position.longitude),
        icon: google.BitmapDescriptor.fromBytes(positionIconBytes));
  }

  @override
  Marker toFlutterMapMarker() {
    return Marker(
        width: 240,
        height: 63,
        point: position,
        anchorPos: AnchorPos.exactly(Anchor(120, 1)),
        builder: (context) => MarkerNew(address: address));
  }
}

class MarkerDataDriver extends MarkerDataInterface {
  String assetAddress = 'images/marker_taxi.png';

  MarkerDataDriver({required String id, required LatLng position})
      : super(id: id, position: position);

  @override
  google.Marker toGoogleMarker(
      Uint8List carIconBytes, Uint8List positionIconBytes) {
    return google.Marker(
        markerId: google.MarkerId(id),
        position: google.LatLng(position.latitude, position.longitude),
        icon: google.BitmapDescriptor.fromBytes(carIconBytes));
  }

  @override
  Marker toFlutterMapMarker() {
    return Marker(
        width: 48,
        height: 48,
        point: position,
        builder: (context) => Image.asset(assetAddress));
  }
}

extension PassengerAddressToFullLocation on CurrentOrderMixin$Point {
  LatLng toLatLng() {
    return LatLng(lat, lng);
  }
}
