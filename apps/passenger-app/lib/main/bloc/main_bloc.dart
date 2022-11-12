import 'dart:typed_data';

import 'package:client_shared/components/marker_new.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/plugin_api.dart';

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
  //List<MarkerDataInterface> markers;
  bool isInteractive;
  int bookedOrdersCount;

  MainBlocState(
      {required this.isInteractive,
      //required this.markers,
      this.bookedOrdersCount = 0});
}

// MainBloc

// Marker

extension PassengerAddressToFullLocation on CurrentOrderMixin$Point {
  LatLng toLatLng() {
    return LatLng(lat, lng);
  }
}
