import 'package:client_shared/config.dart';
import 'package:client_shared/map_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'address_item_view.dart';
import 'address_location_selection_view.dart';
import 'package:client_shared/components/back_button.dart';
import '../generated/l10n.dart';
import '../location_selection/welcome_card/place_search_sheet_view.dart';
import 'package:client_shared/components/marker_new.dart';
import 'package:client_shared/theme/theme.dart';
import '../graphql/generated/graphql_api.graphql.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:latlong2/latlong.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AddressDetailsView extends StatefulWidget {
  final GetAddresses$Query$PassengerAddress? address;
  final PassengerAddressType? defaultType;
  final FullLocation? currentLocation;

  const AddressDetailsView(
      {this.currentLocation, this.address, this.defaultType, Key? key})
      : super(key: key);

  @override
  State<AddressDetailsView> createState() => _AddressDetailsViewState();
}

class _AddressDetailsViewState extends State<AddressDetailsView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late MapController mapController;
  String title = "";
  String? details;
  PassengerAddressType? type;

  @override
  void initState() {
    mapController = MapController();
    mapController.onReady.then((value) {
      if (widget.address != null) {
        mapController.move(widget.address!.location.toLatLng(), 16);
      }
    });
    if (widget.address != null) {
      title = widget.address!.title;
      details = widget.address!.details;
      type = widget.address!.type;
    } else {
      type = widget.defaultType;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              const VroomBackButton(),
              const Spacer(),
              if (widget.address != null)
                Mutation(
                    options: MutationOptions(
                        document: DELETE_ADDRESS_MUTATION_DOCUMENT),
                    builder: (RunMutation runMutation, QueryResult? result) {
                      return CupertinoButton(
                        onPressed: () async {
                          final args =
                              DeleteAddressArguments(id: widget.address!.id)
                                  .toJson();
                          await runMutation(args).networkResult;
                          if (!mounted) return;
                          Navigator.pop(context);
                        },
                        minSize: 0,
                        padding: const EdgeInsets.all(0),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Ionicons.trash,
                                color: CustomTheme.neutralColors.shade600,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4, top: 4),
                                child: Text(
                                  "Delete",
                                  style: TextStyle(
                                      color:
                                          CustomTheme.neutralColors.shade600),
                                ),
                              )
                            ]),
                      );
                    })
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Name your favorite location",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 16),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: title,
                  onChanged: (value) => title = value,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Ionicons.ellipse,
                      color: CustomTheme.neutralColors,
                      size: 12,
                    ),
                    isDense: true,
                    hintStyle: Theme.of(context).textTheme.labelLarge,
                    hintText: S.of(context).create_address_title_textfield_hint,
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).create_address_name_empty_error;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<PassengerAddressType>(
                  value: type,
                  icon: const Icon(
                    Ionicons.chevron_down,
                    color: CustomTheme.neutralColors,
                  ),
                  validator: (PassengerAddressType? type) => (type != null
                      ? null
                      : "Please select the type of address"),
                  decoration: InputDecoration(
                    hintText: "Type",
                    hintStyle: Theme.of(context).textTheme.labelLarge,
                    isDense: true,
                    prefixIcon: const Icon(
                      Ionicons.ellipse,
                      color: CustomTheme.neutralColors,
                      size: 12,
                    ),
                  ),
                  items: <DropdownMenuItem<PassengerAddressType>>[
                    createAddressType(PassengerAddressType.home),
                    createAddressType(PassengerAddressType.work),
                    createAddressType(PassengerAddressType.gym),
                    createAddressType(PassengerAddressType.cafe),
                    createAddressType(PassengerAddressType.park),
                    createAddressType(PassengerAddressType.parent),
                    createAddressType(PassengerAddressType.partner),
                    createAddressType(PassengerAddressType.other),
                  ],
                  onChanged: (PassengerAddressType? value) => type = value,
                ),
              ],
            ),
          ),
          const Spacer(),
          CupertinoButton(
            minSize: 0,
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: CustomTheme.neutralColors.shade200,
                        blurRadius: 5,
                        spreadRadius: 1)
                  ]),
              constraints: const BoxConstraints(minHeight: 100, maxHeight: 350),
              child: FlutterMap(
                mapController: mapController,
                options: MapOptions(
                    center: widget.address?.location.toLatLng() ??
                        widget.currentLocation?.latlng,
                    onTap: (position, latlng) async {
                      final location =
                          await showBarModalBottomSheet<FullLocation>(
                              context: context,
                              builder: (context) {
                                return AddressLocationSelectionView(
                                    details != null
                                        ? FullLocation(
                                            latlng: mapController.center,
                                            address: details!,
                                            title: title)
                                        : widget.currentLocation);
                              });
                      if (location == null) return;
                      mapController.move(location.latlng, 15);
                      setState(() {
                        details = location.address;
                      });
                    },
                    zoom: 15.0,
                    interactiveFlags: InteractiveFlag.none),
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
                    plugin: const LocationMarkerPlugin(
                        centerOnLocationUpdate: CenterOnLocationUpdate.never),
                  ),
                  MarkerNew(address: details).centered(),
                ],
              ),
            ),
          ),
          const Spacer(),
          if (widget.address == null)
            Mutation(
                options:
                    MutationOptions(document: CREATE_ADDRESS_MUTATION_DOCUMENT),
                builder: (
                  RunMutation runMutation,
                  QueryResult? result,
                ) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (details == null || title.isEmpty)
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  final args = CreateAddressArguments(
                                          input: CreatePassengerAddressInput(
                                              title: title,
                                              details: details!,
                                              type: type,
                                              location: PointInput(
                                                  lat: mapController
                                                      .center.latitude,
                                                  lng: mapController
                                                      .center.longitude)))
                                      .toJson();
                                  await runMutation(args).networkResult;
                                  if (!mounted) return;
                                  Navigator.pop(context);
                                }
                              },
                        child: Text(S.of(context).action_save)),
                  );
                }),
          if (widget.address != null)
            Mutation(
                options:
                    MutationOptions(document: UPDATE_ADDRESS_MUTATION_DOCUMENT),
                builder: (
                  RunMutation runMutation,
                  QueryResult? result,
                ) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (details == null || title.isEmpty)
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  final args = UpdateAddressArguments(
                                          id: widget.address!.id,
                                          update: CreatePassengerAddressInput(
                                              title: title,
                                              details: details!,
                                              type: type,
                                              location: PointInput(
                                                  lat: mapController
                                                      .center.latitude,
                                                  lng: mapController
                                                      .center.longitude)))
                                      .toJson();
                                  await runMutation(args).networkResult;
                                  if (!mounted) return;
                                  Navigator.pop(context);
                                }
                              },
                        child: Text(S.of(context).action_save)),
                  );
                })
        ],
      ),
    );
  }

  DropdownMenuItem<PassengerAddressType> createAddressType(
      PassengerAddressType type) {
    return DropdownMenuItem(
        value: type,
        child: Row(children: [
          Icon(
            getAddressTypeIcon(type),
            color: Colors.grey,
          ),
          const SizedBox(width: 8),
          Text(getAddressTypeName(context, type)),
        ]));
  }
}

extension AddressLocation on GetAddresses$Query$PassengerAddress$Point {
  LatLng toLatLng() {
    return LatLng(lat, lng);
  }
}
