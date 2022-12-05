import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:client_shared/components/vroom_sheet_view.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../address/address_details_view.dart';
import '../../address/address_item_view.dart';
import '../../address/address_list_view.dart';
import '../../graphql/generated/graphql_api.graphql.dart';
import '../../location_selection/welcome_card/place_search_sheet_view.dart';
import '../../main/bloc/main_bloc.dart';
import '../../main/bloc/passenger_profile_cubit.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:latlong2/latlong.dart';

import '../../main/bloc/current_location_cubit.dart';

class WelcomeCardView extends StatelessWidget {
  const WelcomeCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VroomSheetView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<PassengerProfileCubit, GetCurrentOrder$Query$Passenger?>(
            builder: (context, state) {
              return Text(
                "Hello${state?.firstName != null ? " ${state!.firstName!}" : ""}!",
                style: Theme.of(context).textTheme.labelMedium,
              );
            },
          ).pOnly(bottom: 2),
          Text(
            "Where are you going?",
            style: Theme.of(context).textTheme.headlineMedium,
          ).pOnly(),
          CupertinoButton(
            padding: const EdgeInsets.symmetric(vertical: 8),
            onPressed: () async {
              final List<FullLocation>? result = await showBarModalBottomSheet(
                  useRootNavigator: true,
                  context: context,
                  builder: (context) => PlaceSearchSheetView(
                      context.read<CurrentLocationCubit>().state));
              if (result == null) return;
              context.read<MainBloc>().add(ShowPreview(
                  points: result, selectedOptions: [], couponCode: null));
            },
            child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: CustomTheme.neutralColors.shade100,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Icon(
                      Ionicons.search,
                      color: CustomTheme.primaryColors,
                    ).pOnly(bottom: 4),
                    Text("Where is your destination?",
                            style: Theme.of(context).textTheme.labelLarge)
                        .pOnly(left: 8)
                  ],
                )),
          ),
          BlocBuilder<PassengerProfileCubit, GetCurrentOrder$Query$Passenger?>(
              builder: (context, state) {
            if (state == null) {
              return const SizedBox();
            }
            return Query(
                options: QueryOptions(document: GET_ADDRESSES_QUERY_DOCUMENT),
                builder: (QueryResult result,
                    {Refetch? refetch, FetchMore? fetchMore}) {
                  if (result.isLoading) {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }
                  final addresses = result.data != null
                      ? GetAddresses$Query.fromJson(result.data!)
                          .passengerAddresses
                      : <GetAddresses$Query$PassengerAddress>[];
                  return Column(children: [
                    Container(
                      constraints: const BoxConstraints(maxHeight: 150),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: addresses
                              .map((GetAddresses$Query$PassengerAddress
                                      address) =>
                                  WelcomeCardSavedLocationButton(
                                      onTap: () {
                                        final currentLocation = context
                                            .read<CurrentLocationCubit>()
                                            .state;
                                        if (currentLocation == null) {
                                          showLocationNotDeterminedDialog(
                                              context);
                                          return;
                                        }
                                        context.read<MainBloc>().add(
                                                ShowPreview(points: [
                                              currentLocation,
                                              address.toFullLocation()
                                            ], selectedOptions: []));
                                      },
                                      type: address.type,
                                      address: address.details))
                              .toList(),
                        ),
                      ),
                    ),
                    AddressListAddLocationButton(onTap: () async {
                      final currentLocation =
                          context.read<CurrentLocationCubit>().state;
                      await showBarModalBottomSheet(
                          context: context,
                          builder: (_) {
                            return BlocProvider.value(
                                value: BlocProvider.of<CurrentLocationCubit>(
                                    context),
                                child: AddressDetailsView(
                                    currentLocation: currentLocation));
                          });
                      refetch!();
                    })
                  ]);
                });
          })
        ],
      ),
    );
  }

  void showLocationNotDeterminedDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Location"),
            content: const Text(
                "We were not able to get your current location using your device's GPS, Please check device location permission for app from device's settings. Alternatively you can use search field above to select your pickup point."),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("OK", textAlign: TextAlign.end))
            ],
          );
        });
  }
}

extension PassengerAddressToFullLocation
    on GetAddresses$Query$PassengerAddress {
  FullLocation toFullLocation() {
    return FullLocation(
        latlng: LatLng(location.lat, location.lng),
        address: details,
        title: title);
  }
}

class WelcomeCardSavedLocationButton extends StatelessWidget {
  final Function() onTap;
  final PassengerAddressType type;
  final String address;

  const WelcomeCardSavedLocationButton(
      {required this.onTap,
      required this.type,
      required this.address,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: const EdgeInsets.symmetric(vertical: 8),
        onPressed: onTap,
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          AddressListIcon(getAddressTypeIcon(type)),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getAddressTypeName(context, type),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  address,
                  style: Theme.of(context).textTheme.labelMedium,
                )
              ],
            ),
          )
        ]));
  }
}
