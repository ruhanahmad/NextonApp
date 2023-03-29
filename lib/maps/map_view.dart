import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlng/latlng.dart';
import 'package:nextonapp/main.dart';
import 'package:flutter/material.dart';
import 'constant_map.dart';


class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  void locatePosition() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    
   Position currentPosition = position;
    LatLng latLngPosition = LatLng(position.latitude, position.longitude);
        
    // Ask permission from device
    Future<void> requestPermission() async {
    LocationPermission permission;
   permission = await Geolocator.requestPermission();
    }
}
  MapController mapController = MapController();
  @override
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 32, 32),
        title: const Text('Flutter MapBox'),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              minZoom: 5,
              maxZoom: 18,
              zoom: 13,
              center: AppConstants.myLocation,
            ),
            mapController: MapController(),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/ruhanahmad/clfqi8c9l001v01qw7z45igvp/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicnVoYW5haG1hZCIsImEiOiJjbGZwaGd5Mm4xMXc5M3VtaHNyaGh4aWs5In0.yMujkiepj2YpRA_evivVGg",
                additionalOptions: {
                  'mapStyleId': AppConstants.mapBoxStyleId,
                  'accessToken': AppConstants.mapBoxAccessToken,
                },
              ),
            ],
          ),
          ElevatedButton.icon(onPressed: ()async{
//  var position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
        // determinePosition();
      //  print(position);
      locatePosition();
    //      mapController.
    //      animateCamera(
    //   CameraUpdate.newLatLng(
    //     LatLng(
    //       position.latitude,
    //       position.longitude,
    //     ),
    //   ),
    // );


          }, icon:Icon(Icons.abc_outlined), label: Text("data"))
        ],
      ),
    );
  }

}
