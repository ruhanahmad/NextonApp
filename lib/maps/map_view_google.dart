import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_marker/marker_icon.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nextonapp/main.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import 'package:location_geocoder/location_geocoder.dart';
class MapViewGoogle extends StatefulWidget {
  const MapViewGoogle({super.key});

  @override
  State<MapViewGoogle> createState() => _MapViewGoogleState();
}

class _MapViewGoogleState extends State<MapViewGoogle> {
  StreamSubscription<QuerySnapshot>? _subscription;
     String session = "1212";
     var uuid = Uuid();

 TextEditingController textEditingController = TextEditingController();
 List<dynamic> _placesList = [];
  Future<Position?> getsCurrentLocation()async{
   await Geolocator.requestPermission().then((value) {
        
   }).onError((error, stackTrace) async{
await Geolocator.requestPermission();
   });
await Geolocator.getCurrentPosition();
print(Geolocator.getCurrentPosition());
  }


  List<Marker> _marker = [];
  List<Marker> 
  heyMarker = [
   Marker(markerId: MarkerId("1")
   ,
   position:LatLng(31.3936163,73.0209934),
   infoWindow: InfoWindow(
    title: "Current position"
   )
   )
  ];
  Completer<GoogleMapController>  _completer = Completer();
  static final CameraPosition _cameraPosition = CameraPosition(target: LatLng(51.5090214, -0.1982948),zoom: 14.02);
     void getUpdatess() {
      setState(() {
              if (session == null){
        session = uuid.v4();
      }
      });
  sendData(textEditingController.text);


    }
    final LocatitonGeocoder geocoder = LocatitonGeocoder("AIzaSyCZJDq4ZZiah_srzkzjQDtxnXVE-gbf85M");

    sendData(String input)async{
      String kPLACES_API_KEY = "AIzaSyCZJDq4ZZiah_srzkzjQDtxnXVE-gbf85M";
       String baseURL =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request = '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$session';

      var response = await http.get(Uri.parse(request));
      print(response);

      if(response.statusCode == 200){
 
setState(() {
  _placesList = jsonDecode(response.body.toString())['predictions'];
});


      }
      else{
        throw Exception("Failed to Load Data");
      }
    }

 
  @override
  void initState() {
    textEditingController.addListener(() {
       getUpdatess();
    });
   _subscription = FirebaseFirestore.instance.collection('labour').snapshots().listen((snapshot) {
      // Clear the existing markers list
      _marker.clear();

      // Add new markers based on the data in the snapshot
      for (var document in snapshot.docs) {
        var marker = Marker(
          markerId: MarkerId(document.id),
          position: LatLng(double.parse(document.data()['lat']), double.parse(document.data()['long'])),
          infoWindow: InfoWindow(
            title: document.data()['labourName'],
            snippet: document.data()['labourWork'],
          ),
        );
        _marker.add(marker);
      }

      // Update the UI to show the new markers
      setState(() {});
    });

    // _marker.addAll(heyMarker);
    super.initState();
    
  }
  @override
  void dispose() {
    super.dispose();

    // Cancel the stream subscription when the screen is disposed
    _subscription?.cancel();
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
       floatingActionButton: FloatingActionButton(
        
        onPressed: ()async{
           getUpdatess();
           GoogleMapController controller = await _completer.future;
    await    getsCurrentLocation().then((value) async{
          // print(value.accuracy == null ? "" :value.accuracy);
           controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.7127753, -74.0059728),zoom: 2))
            
            
            );
            // print(value.longitude);
            setState(() {
              
            });
             _marker.add(Marker(
                icon:
                //  BitmapDescriptor.defaultMarker,
                await  MarkerIcon.pictureAsset(assetPath: "assets/labour.png", width: 60, height: 60),
              markerId: MarkerId("2"),
              position: LatLng(48.8566, 2.3522),
              draggable: true,
               flat: true,
              infoWindow: InfoWindow(title: "asd" +"   "+"asdas")
             ));
        });
         

           
 

       },
       child: Icon(Icons.location_on),
       ),
      body:
           Stack(
                children: <Widget>[
                  Container(
                    child: 
                          GoogleMap(initialCameraPosition: _cameraPosition,
      mapType: MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
       onMapCreated: (GoogleMapController controller) {
            _completer.complete(controller);
      
       },
       markers: Set<Marker>.of(_marker),
       
       ),
                  ),
                  // Stack(
                  //     children: <Widget>[
                  //   Positioned(
                  //   bottom: 0,
                  //   right: 250,
                  //   child: ElevatedButton(
                  //         onPressed: (){} ,
                  //         child: Text("dosomething"),
                  //         // color: Colors.grey,
                  //         // textColor: Colors.black,
                          
                  //         )),
                  //   ]),
                  Container( 
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Row(
                         children: <Widget> [

                          Expanded(
child: 
new TextFormField(
  controller: textEditingController,
                      decoration: new InputDecoration(
                        labelText: "Enter Address",
                        fillColor: Colors.white,
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                          ),
                        ),
                        //fillColor: Colors.green
                      ),
                      validator: (val) {
                        // if(val.length==0) {
                        //   return "Email cannot be empty";
                        // }else{
                        //   return null;
                        // }
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: new TextStyle(
                        fontFamily: "Poppins",
                      ),
                    ),

                   ) ]
                         )
                  ),
                  textEditingController.text.length == 0 ?  Text("data") :
                                  Padding(
                                    padding: const EdgeInsets.only(top:120.0),
                                    child: Container( 
                                      // color: Colors.white,
                                                    height: MediaQuery.of(context).size.width * 0.3,
                                                    width: MediaQuery.of(context).size.width * 0.8,
                                                    child: Row(
                                                           children: <Widget> [
                                  
                                                            Expanded(
                                  child: 
                                  ListView.builder(
                                    itemCount:_placesList.length ,
                                    itemBuilder:(BuildContext context, index) {
                                      return ListTile(
                                         onTap: () async{
                                           final address = await geocoder.findAddressesFromQuery(_placesList[index]["description"]);
                                           textEditingController.text = "";
                                            // List<Location> locations = await locationFromAddress("Pakistan");
                                            // print(locations.last.longitude);
                                            print(address.first.coordinates.latitude);
                                         },
                                        title: Text(_placesList[index]["description"],style: TextStyle(color: Colors.black),));
                                    }) )
                                 
                                  
                                                      ]
                                                           )
                                                    ),
                                  ),

    ]
    
    // StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection('labour').snapshots(),
    // builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //    if (!snapshot.hasData) {
    //         return Center(
    //           child: CircularProgressIndicator(),
    //         );
    //       }
    //       final docs = snapshot.data!.docs;
    //   return 
  
    // },
    
    )
       
    
    );
    
   

  
  }
}