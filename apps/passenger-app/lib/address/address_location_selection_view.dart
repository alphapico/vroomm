import 'dart:async';

import 'package:client_shared/config.dart';
import 'package:client_shared/map_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:osm_nominatim/osm_nominatim.dart';
import '../location_selection/welcome_card/place_search_sheet_view.dart';
import 'package:client_shared/components/marker_new.dart';
import 'package:velocity_x/velocity_x.dart';

class AddressLocationSelectionView extends StatefulWidget {
  final FullLocation? defaultLocation;

  const AddressLocationSelectionView(this.defaultLocation, {Key? key})
      : super(key: key);

  @override
  State<AddressLocationSelectionView> createState() =>
      _AddressLocationSelectionViewState();
}

class _AddressLocationSelectionViewState
    extends State<AddressLocationSelectionView> {
  final MapController mapController = MapController();
  String? address;
  late StreamSubscription<MapEvent> subscription;

  @override
  void initState() {
    address ??= widget.defaultLocation?.address;
    mapController.onReady.then((value) {
      subscription =
          mapController.mapEventStream.listen((MapEvent mapEvent) async {
        if (mapEvent is MapEventMoveStart) {
          setState(() {
            address = null;
          });
        } else if (mapEvent is MapEventMoveEnd) {
          final reverseSearchResult = await Nominatim.reverseSearch(
              lat: mapController.center.latitude,
              lon: mapController.center.longitude,
              nameDetails: true);
          final fullLocation = reverseSearchResult.convertToFullLocation();
          setState(() {
            address = fullLocation.address;
          });
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
          maxZoom: 20,
          zoom: 16,
          center: widget.defaultLocation?.latlng,
          interactiveFlags: InteractiveFlag.drag |
              InteractiveFlag.pinchMove |
              InteractiveFlag.pinchZoom |
              InteractiveFlag.doubleTapZoom),
      children: [
        if (mapProvider == MapProvider.openStreetMap ||
            (mapProvider == MapProvider.googleMap &&
                mapBoxAccessToken.isEmptyOrNull))
          TileLayerWidget(
            options: openStreetTileLayer,
          ),
        if (mapProvider == MapProvider.mapBox ||
            (mapProvider == MapProvider.googleMap &&
                !mapBoxAccessToken.isEmptyOrNull))
          TileLayerWidget(
            options: mapBoxTileLayer,
          ),
        LocationMarkerLayerWidget(
          options: LocationMarkerLayerOptions(),
          plugin: LocationMarkerPlugin(
              centerOnLocationUpdate: widget.defaultLocation == null
                  ? CenterOnLocationUpdate.once
                  : CenterOnLocationUpdate.never),
        ),
        MarkerNew(address: address).centered(),
        SafeArea(
          top: false,
          minimum: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: address == null
                        ? null
                        : () {
                            Navigator.of(context).pop(FullLocation(
                                latlng: mapController.center,
                                address: address!,
                                title: widget.defaultLocation?.title ?? ""));
                          },
                    child: const Text("Confirm location")),
              ),
            ],
          ).objectBottomCenter(),
        )
      ],
    );
  }
}
