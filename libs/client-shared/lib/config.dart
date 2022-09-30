import 'package:flutter/foundation.dart';

import './map_providers.dart';
import 'package:latlong2/latlong.dart';

// String serverIP = "x.x.x.x";
// 10.0.2.2 // android localhost
String serverIP = "10.0.2.2";

bool demoMode = false;
String companyName = "vroom";
MapProvider mapProvider = MapProvider.openStreetMap;

// MapBox Configuration (Only if Map Provider is set to mapBox)
String mapBoxAccessToken = "";
String mapBoxUserId = "mapbox";
String mapBoxTileSetId = "streets-v11";

String loginTermsAndConditionsUrl = "";

String defaultCurrency = "MYR";
String defaultCountryCode = "+60";
const List<double> tipPresets = [10, 20, 50];

LatLng fallbackLocation = LatLng(3.1615, 101.7113);

// Menu website url
String? websiteUrl;
