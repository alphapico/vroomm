import 'dart:async';

import 'package:client_shared/config.dart';
import 'package:client_shared/map_providers.dart';
import 'package:client_shared/theme/theme.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_codes/country_codes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';

import 'package:lifecycle/lifecycle.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'current_location_cubit.dart';

import 'config.dart';

import 'main_bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'graphql/generated/graphql_api.dart';
import 'graphql_provider.dart';
import 'package:geolocator/geolocator.dart';

// ignore: avoid_void_async
void main() async {
  await initHiveForFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Geolocator.requestPermission();
  await Firebase.initializeApp();
  await Hive.openBox('user');
  await CountryCodes.init(); //TODO ori
  final locale = CountryCode.fromDialCode('+60'); // TODO  SHAM commented
  // final locale = CountryCodes.detailsForLocale(); //TODO ori
  if (locale.dialCode != null) {
    //TODO ori
    defaultCountryCode = locale.dialCode!;
  }
  // defaultCountryCode = '+60'; //TODO  SHAM commented
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Box>(
      valueListenable: Hive.box('user').listenable(),
      builder: (context, Box box, widget) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<MainBloc>(
                lazy: false, create: (context) => MainBloc()),
            BlocProvider<CurrentLocationCubit>(
                lazy: false, create: (context) => CurrentLocationCubit())
          ],
          child: MyGraphqlProvider(
            uri: "${serverUrl}graphql",
            subscriptionUri: "${wsUrl}graphql",
            jwt: box.get('jwt').toString(),
            child: MaterialApp(
                title: 'Vroom',
                navigatorObservers: [defaultLifecycleObserver],
                debugShowCheckedModeBanner: false,
                theme: CustomTheme.theme1,
                home: MyHomePage()),
          ),
        );
      },
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Refetch? refetch;

  MyHomePage({Key? key}) : super(key: key) {
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    final mainBloc = context.read<MainBloc>();
    final locationCubit = context.read<CurrentLocationCubit>();
    return Scaffold(
        key: scaffoldKey,
        drawer: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Drawer(
            backgroundColor: CustomTheme.primaryColors.shade100,
            child: BlocBuilder<MainBloc, MainState>(
              builder: (context, state) {
                //DrawerView
                return Container();
              },
            ),
          ),
        ),
        body: ValueListenableBuilder(
            valueListenable: Hive.box('user').listenable(),
            builder: (context, Box box, widget) {
              if (box.get('jwt') == null) {
                //UnregisteredDriverMessagesView
                return Container();
              }
              return LifecycleWrapper(
                  onLifecycleEvent: (event) {
                    if (event == LifecycleEvent.active && refetch != null) {
                      refetch!();
                      //updateNotificationId
                    }
                  },
                  child: FutureBuilder<PackageInfo>(
                      future: PackageInfo.fromPlatform(),
                      builder: (context, snapshot) {
                        return Query(
                            options: QueryOptions(
                                document: ME_QUERY_DOCUMENT,
                                variables: MeArguments(
                                        versionCode: int.parse(
                                            snapshot.data?.buildNumber ??
                                                "999999"))
                                    .toJson(),
                                fetchPolicy: FetchPolicy.noCache),
                            builder: (QueryResult result,
                                {Refetch? refetch, FetchMore? fetchMore}) {
                              if (result.isLoading || result.hasException) {
                                // QueryResultView
                                return Container();
                              }
                              this.refetch = refetch;
                              final mquery = Me$Query.fromJson(result.data!);
                              if (mquery.requireUpdate ==
                                  VersionStatus.mandatoryUpdate) {
                                mainBloc.add(
                                    VersionStatusEvent(mquery.requireUpdate));
                              } else {
                                mainBloc.add(DriverUpdated(mquery.driver!));
                                locationCubit
                                    .setRadius(mquery.driver!.searchDistance);
                              }
                              return BlocConsumer<MainBloc, MainState>(
                                  listenWhen:
                                      (MainState previous, MainState next) {
                                if (previous is StatusUnregistered &&
                                    next is StatusUnregistered &&
                                    previous.driver?.status ==
                                        next.driver?.status) {
                                  return false;
                                }
                                if ((previous is StatusOnline) &&
                                    next is StatusOnline) {
                                  return false;
                                }
                                return true;
                              }, listener: (context, state) {
                                if (state is StatusOnline) {
                                  refetch!();
                                }
                              }, builder: (context, state) {
                                if (state is StatusUnregistered) {
                                  // UnregisteredDriverMessagesView
                                  return Container();
                                }
                                return Stack(children: [
                                  if (mapProvider ==
                                          MapProvider.openStreetMap ||
                                      mapProvider == MapProvider.mapBox)
                                    // OpenStreetMapProvider,
                                    if (mapProvider == MapProvider.googleMap)
                                      // GoogleMapProvider,
                                      SafeArea(
                                        minimum: const EdgeInsets.all(16),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            // _getMenuButton
                                            const Spacer(),
                                            // _getWalletButton
                                            if (state is! StatusInService)
                                              const Spacer(),
                                            //_getOnlineOfflineButton
                                          ],
                                        ),
                                      ),
                                  if (state is StatusOffline ||
                                      (state is StatusOnline &&
                                          state.orders.isEmpty))
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: //NoticeBar
                                          Container(),
                                    ),
                                  if (state is StatusOnline)
                                    Positioned(
                                      bottom: 0,
                                      child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 350,
                                          child: //OrdersCarouselView
                                              Container()),
                                    ),
                                  if (state is StatusInService &&
                                      state.driver!.currentOrders.isNotEmpty)
                                    Positioned(
                                      bottom: 0,
                                      child: Subscription(
                                          options: SubscriptionOptions(
                                              document:
                                                  ORDER_UPDATED_SUBSCRIPTION_DOCUMENT,
                                              fetchPolicy: FetchPolicy.noCache),
                                          builder: (QueryResult result) {
                                            if (result.data != null) {
                                              WidgetsBinding.instance
                                                  .addPostFrameCallback((_) {
                                                refetch!();
                                              });
                                            }
                                            return SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: //OrderStatusCardView
                                                    Container());
                                          }),
                                    ),
                                ]);
                              });
                            });
                      }));
            }));
  }
}
