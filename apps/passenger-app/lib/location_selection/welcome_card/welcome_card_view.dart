import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:client_shared/components/vroom_sheet_view.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

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
              // read MainBloC
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
          // Bloc Address
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
