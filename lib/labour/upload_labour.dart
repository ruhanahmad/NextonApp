


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location_geocoder/location_geocoder.dart';
import 'package:nextonapp/constants/constants.dart';
import 'package:nextonapp/controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class City {
  
  final String name;

  City( this.name);
}
class LabourUpload extends StatefulWidget {
  const LabourUpload({super.key});

  @override
  State<LabourUpload> createState() => _LabourUploadState();
}

class _LabourUploadState extends State<LabourUpload> {



  
  TextEditingController textEditingController = TextEditingController();
    final LocatitonGeocoder geocoder = LocatitonGeocoder("AIzaSyCZJDq4ZZiah_srzkzjQDtxnXVE-gbf85M");
   List<dynamic> _placesList = [];
  var uuid = Uuid();
   XFile? _imageFile;
  UserController userController = Get.put(UserController());


  
  final ImagePicker _picker = ImagePicker();
    var imageFile;
    void  selectImages()async {
    final XFile? images = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {

   _imageFile =  images!;

    });
    
    if (images !=null) {
        userController.imageFile = images.path == null ? "" :images.path;
    userController.update();
    }
  
  }
  var session = "12";
   List<City> cities = [];
     void getUpdatess() {
      setState(() {
              if (session == null){
        session = uuid.v4();
      }
      });
  sendData(textEditingController.text);


    }
    final LocatitonGeocoder geocoders = LocatitonGeocoder("AIzaSyCZJDq4ZZiah_srzkzjQDtxnXVE-gbf85M");

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
    super.initState();
 textEditingController.addListener(() {
       getUpdatess();
    });
    FirebaseFirestore.instance
        .collection('Category')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        City city = new City( doc['name']);
        cities.add(city);
      });

      setState(() {});
    });
  }
  

    String? _dropDownValue;
      int _selectedIndex = 0;
  List<String> _options = ['Option 1', 'Option 2', 'Option 3'];
    String? _selectedChip;

  void _onChipSelected(String selectedChip) {
    setState(() {
      userController.selectedChip = selectedChip;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return
    GetBuilder<UserController>(
      init: UserController(),
      builder: (_){
   return  Scaffold(
appBar: AppBar(
//   title: IconButton(onPressed: (){
//  userController.getCatgeories();
// }, icon: Icon(Icons.access_alarm_sharp)),

),

      body: SafeArea(
        
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
        
        
        
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child:
                     TextFormField(
                      onChanged: (value) {
                        userController.labourName = value;
                      },
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
                          filled: true,
                          fillColor: kPrimaryColor.withOpacity(0.3),
                          labelText: 'Labour Name',
                          labelStyle: kFormTextStyle,
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide:  BorderSide(color: kPrimaryColor),
                          )),
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter an Product Name';
                        }
                        return null;
                      },
                    ),
                  ),
                   SizedBox(height: 30,),
  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child:
                     TextFormField(
                      onChanged: (value) {
                        userController.labourWork = value;
                      },
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
                          filled: true,
                          fillColor: kPrimaryColor.withOpacity(0.3),
                          labelText: 'Work',
                          labelStyle: kFormTextStyle,
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide:  BorderSide(color: kPrimaryColor),
                          )),
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter an Work';
                        }
                        return null;
                      },
                    ),
                  ),

       
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
                        color: Colors.black,
                        fontFamily: "Poppins",
                      ),
                    ),

                   ) ]
                         )
                  ),
                  textEditingController.text.length == 0 ?  Text("data") :
                                  Padding(
                                    padding: const EdgeInsets.only(top:20.0),
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
                                           final address = await geocoders.findAddressesFromQuery(_placesList[index]["description"]);
                                           textEditingController.text = "";
                                            // List<Location> locations = await locationFromAddress("Pakistan");
                                            // print(locations.last.longitude);
                                      userController.textPioneer = _placesList[index]["description"];
                                      userController.lat   =     address.first.coordinates.latitude.toString();
                                      userController.long   =     address.first.coordinates.longitude.toString();
                                      userController.update();
                                            print(address.first.coordinates.latitude);
                                         },
                                        title: Text(_placesList[index]["description"],style: TextStyle(color: Colors.black),));
                                    }) )
                                 
                                  
                                                      ]
                                                           )
                                                    ),
                                  ),
                                                                       ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: Color(0xFF9D0105),),
                                  child: Icon(Icons.upload_file,),
                                  onPressed:()async{
                              await       userController.uploadLabour();
                                  },
                                ),
        
              //  Center(child: GestureDetector(
              //   onTap: ()async{
              //     await alerts();
              //   },
              //    child: Container(height: 30,width: 30,child: IconButton(
              //     onPressed: ()async {
              //         await alerts();
              //     }, 
              //    icon: Icon(Icons.abc_rounded)),),
              //  ),),
        
                  //                          Container(
                  // padding: const EdgeInsets.all(12.0),
                  // height: 85,
                  // decoration: BoxDecoration(
                  //   color: Colors.white,
                  //   borderRadius: BorderRadius.circular(10.0),
                  // ),
                  // child: 
        
        
        
        
        
            //             DropdownButton(
            //   hint: _dropDownValue == null
            // ? Text(_.dropDownValue.toString())
            //       : Text(
            //           _dropDownValue.toString(),
            //           style: TextStyle(color: Colors.blue),
            //         ),
            //   isExpanded: true,
            //   iconSize: 30.0,
            //   style: TextStyle(color: Colors.blue),
            //   items: ['Premium', 'Topaz'].map(
            //     (val) {
            //       return DropdownMenuItem<String>(
            //         value: val,
            //         child: Text(val),
            //       );
            //     },
            //   ).toList(),
            //   onChanged: (val) {
            //        print(val);
             
            //         _.dropDownValue = val.toString();
            //         _.update();
          
            //   },
            // ),
        
        
         
                // ),
             
              
                 
          ],),),
        ),
      ),
    );
    });
 
  }
}