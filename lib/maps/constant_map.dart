import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nextonapp/main.dart';



import 'package:latlong2/latlong.dart';
class GeolocatorService {
  Future<Position?> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    } else {
      throw Exception('Error');
    }
    return await Geolocator.getCurrentPosition();
  }
}
class AppConstants {
  static const String mapBoxAccessToken = 'pk.eyJ1IjoicnVoYW5haG1hZCIsImEiOiJjbGZwaGd5Mm4xMXc5M3VtaHNyaGh4aWs5In0.yMujkiepj2YpRA_evivVGg';

  static const String mapBoxStyleId = 'clfqi8c9l001v01qw7z45igvp';

  static final myLocation = LatLng(51.5090214, -0.1982948);
}

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
// https://api.mapbox.com/styles/v1/ruhanahmad/clfqi8c9l001v01qw7z45igvp/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicnVoYW5haG1hZCIsImEiOiJjbGZwaGd5Mm4xMXc5M3VtaHNyaGh4aWs5In0.yMujkiepj2YpRA_evivVGg
// https://api.mapbox.com/styles/v1/ruhanahmad/clfqi8c9l001v01qw7z45igvp/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicnVoYW5haG1hZCIsImEiOiJjbGZwaGd5Mm4xMXc5M3VtaHNyaGh4aWs5In0.yMujkiepj2YpRA_evivVGg


// "https://api.mapbox.com/styles/v1/dhruv25/{mapStyleId}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}"
// mapbox://styles/ruhanahmad/clfqi8c9l001v01qw7z45igvp

// pk.eyJ1IjoicnVoYW5haG1hZCIsImEiOiJjbGZwaGd5Mm4xMXc5M3VtaHNyaGh4aWs5In0.yMujkiepj2YpRA_evivVGg




// https://api.mapbox.com/styles/v1/ruhanahmad/clfqi8c9l001v01qw7z45igvp/wmts?access_token=pk.eyJ1IjoicnVoYW5haG1hZCIsImEiOiJjbGZwaGd5Mm4xMXc5M3VtaHNyaGh4aWs5In0.yMujkiepj2YpRA_evivVGg