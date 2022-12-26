import 'package:client_shared/config.dart';
import 'package:country_codes/country_codes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lifecycle/lifecycle.dart';
import '../main/bloc/jwt_cubit.dart';

import 'main/graphql_provider.dart';

import 'package:client_shared/theme/theme.dart';

import 'package:geolocator/geolocator.dart';

// ignore: avoid_void_async
void main() async {
  await initHiveForFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.openBox("user");
  if (!kIsWeb) {
    await CountryCodes.init();
    final locale = CountryCodes.detailsForLocale();
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
      providers: [BlocProvider(create: (context) => JWTCubit())],
      child: MyGraphqlProvider(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorObservers: [defaultLifecycleObserver],
            //supportedLocales: S.delegate.supportedLocales,
            theme: CustomTheme.theme1,
            home: Container() //LocationSelectionParentView(),
            ),
      ),
    );
  }
}
