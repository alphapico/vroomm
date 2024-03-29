import 'package:client_shared/config.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:country_codes/country_codes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:passenger_app/main/bloc/main_bloc.dart';
import '../main/bloc/jwt_cubit.dart';

import 'address/address_list_view.dart';
import 'announcements/announcements_list_view.dart';
import 'chat/chat_view.dart';
import 'history/trip_history_list_view.dart';
import 'location_selection/location_selection_parent_view.dart';
import 'location_selection/welcome_card/location_history_item.dart';
import 'main/bloc/current_location_cubit.dart';
import 'main/bloc/passenger_profile_cubit.dart';
import 'main/graphql_provider.dart';

import 'package:client_shared/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:geolocator/geolocator.dart';

import 'profile/profile_view.dart';
import 'reservations/reservation_list_view.dart';
import 'wallet/wallet_view.dart';

// ignore: avoid_void_async
void main() async {
  await initHiveForFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Hive.registerAdapter(LocationHistoryItemAdapter());
  await Hive.openBox<List<LocationHistoryItem>>("history2");
  await Hive.openBox("user");
  if (!kIsWeb) {
    await CountryCodes.init();
    final locale = CountryCode.fromDialCode('+60');
    // final locale = CountryCodes.detailsForLocale();
    if (locale.dialCode != null) {
      defaultCountryCode = locale.dialCode!;
    }
  }
  await Geolocator.requestPermission();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainBloc()),
        BlocProvider(create: (context) => CurrentLocationCubit()),
        BlocProvider(create: (context) => PassengerProfileCubit()),
        BlocProvider(create: (context) => JWTCubit())
      ],
      child: MyGraphqlProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorObservers: [defaultLifecycleObserver],
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          routes: {
            'addresses': (context) => const AddressListView(),
            'announcements': (context) => const AnnouncementsListView(),
            'history': (context) => const TripHistoryListView(),
            'wallet': (context) => const WalletView(),
            'chat': (context) => const ChatView(),
            'reserves': (context) => const ReservationListView(),
            'profile': (context) => BlocProvider.value(
                  value: context.read<PassengerProfileCubit>(),
                  child: BlocProvider.value(
                    value: context.read<JWTCubit>(),
                    child: ProfileView(),
                  ),
                )
          },
          theme: CustomTheme.theme1,
          home: LocationSelectionParentView(),
        ),
      ),
    );
  }
}
