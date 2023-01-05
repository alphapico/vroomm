import 'package:client_shared/config.dart';

String serverUrl = "http://$serverIP:7003/";
// String serverUrl = "http://localhost:7003/";
String wsUrl = serverUrl.replaceFirst("http", "ws");

// Nominatim configuration (Only for Open Street Maps and MapBox)
List<String>? nominatimCountries = ['MY']; // ISO 3166-1alpha2 codes

// Google Places Configuration (Only for Google Map Provider)
String placesApiKey = "AIzaSyB0tGfGTWxAOoJ-oEM7ESKuy7XjA6L6G7A";
String placesCountry = "en";
