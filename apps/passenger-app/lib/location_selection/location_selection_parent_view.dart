import 'package:client_shared/config.dart';
import 'package:client_shared/map_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive/hive.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../location_selection/reservation_messages/looking_sheet_view.dart';
import '../location_selection/welcome_card/place_search_sheet_view.dart';
import '../main/bloc/current_location_cubit.dart';
import '../main/bloc/jwt_cubit.dart';
// passenger-profile
import '../main/map_providers/google_map_provider.dart';
// open street map
//import 'package:ridy/main/pay_for_ride_sheet_view.dart';
//import 'package:ridy/main/rate_ride_sheet_view.dart';
import 'package:client_shared/theme/theme.dart';

import '../graphql/generated/graphql_api.graphql.dart';
import '../main/bloc/main_bloc.dart';
//import '../main/drawer_logged_in.dart';
//import '../main/drawer_logged_out.dart';
//import '../main/order_status_sheet_view.dart';
//import '../main/service_selection_card_view.dart';
import 'welcome_card/welcome_card_view.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

// ignore: must_be_immutable
class LocationSelectionParentView extends StatelessWidget {
  late GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Refetch? refetch;
  MapController? controller;
  LocationSelectionParentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    // mainBloc
    final jwt = Hive.box('user').get('jwt').toString();
    if (!jwt.isEmptyOrNull) {
      context.read<JWTCubit>().login(jwt);
    }
    return Scaffold(
        key: scaffoldKey,
        drawer: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Drawer(
              backgroundColor: CustomTheme.primaryColors.shade100,
              child: Container() //passenger profile draw,
              ),
        ),
        body: Container());
  }

  void setCurrentLocation(BuildContext context, Position position) async {
    final geocodeResult = await Nominatim.reverseSearch(
        lat: position.latitude, lon: position.longitude, nameDetails: true);
    final fullLocation = geocodeResult.toFullLocation();
    try {
      context.read<CurrentLocationCubit>().updateLocation(fullLocation);
      // ignore: empty_catches
    } catch (error) {}
  }
}

class SmallBackFloatingActionButton extends StatelessWidget {
  final Function onPressed;

  const SmallBackFloatingActionButton({
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(16),
      child: FloatingActionButton.small(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 2,
        onPressed: () => onPressed(),
        backgroundColor: CustomTheme.primaryColors.shade50,
        child: Icon(
          Ionicons.arrow_back,
          color: CustomTheme.primaryColors.shade800,
        ),
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.onPressed,
    required this.bookingCount,
  }) : super(key: key);

  final Function onPressed;
  final int bookingCount;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(16),
      child: FloatingActionButton(
        heroTag: 'menuFab',
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: () => onPressed(),
        backgroundColor: Colors.white,
        child: bookingCount == 0
            ? Icon(
                Ionicons.menu,
                color: CustomTheme.primaryColors.shade800,
              )
            : Container(
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(50)),
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: Center(
                    child: Text(
                      bookingCount.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

extension PlaceToFullLocation on Place {
  FullLocation toFullLocation() {
    return FullLocation(
        latlng: LatLng(lat, lon),
        address: displayName,
        title: nameDetails?['name'] ?? "");
  }
}

extension PointMixinHelper on PointMixin {
  LatLng toLatLng() {
    return LatLng(lat, lng);
  }
}

extension FullLocationHelper on FullLocation {
  PointInput toPointInput() {
    return PointInput(lat: latlng.latitude, lng: latlng.longitude);
  }
}

const fitBoundsOptions = FitBoundsOptions(
    padding: EdgeInsets.only(top: 100, bottom: 500, left: 130, right: 130));
