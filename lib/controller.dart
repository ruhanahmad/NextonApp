import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:camera/camera.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:camera/camera.dart';
import 'dart:io' as io;
import 'package:image_picker/image_picker.dart';
import 'package:nextonapp/admin_panel.dart';
import 'package:nextonapp/labour/upload_labour.dart';
class UserController extends GetxController {

String? hintText;
String? loginName;

   Future<UploadTask?> uploadFilesLabour(XFile? files,context) async {
    // EasyLoading.show();
    await getIDo();
     String rand = await tenNumberGenerated();
 var uniqueKeys = firebaseRef.collection("users");
    var uniqueKey = firebaseRef.collection("users");
    if (files == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No file was selected'),
        ),
      );

      return null;
    }

    UploadTask uploadTask;

    // Create a Reference to the file
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('laboutImage') 
        .child('${rand}.jpg');

    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': files.path},
    );
    // EasyLoading.show();

    if (kIsWeb) {
      uploadTask = ref.putData(await files.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(io.File(files.path), metadata);

    await  uploadTask.whenComplete(() async {
        var uploadpaths = await uploadTask.snapshot.ref.getDownloadURL();

             await    FirebaseFirestore.instance.collection("labour").add({
                "labourName":labourName!,
                "labourWork":labourWork,
                "long":long,
                "lat":lat,
                "labourImage":uploadpaths,

           });
        
         
              //  await SendMailss();
           Get.snackbar("Uploaded", "Upload successfully");
          //  Get.to(HomePage());
          // await   sendEmail();
          EasyLoading.dismiss();
        // Get.to(HomePage());
        
      });


    }
    
    // await ref.getDownloadURL().then((value) => updataIdCard(value));

    return Future.value(uploadTask);
  }

 List<UploadTask> _uploadTasksi = [];






















String? textPioneer;
String?  labourName;
String? labourWork;
String? long;
String? lat;
Future uploadLabour() async {
     await    FirebaseFirestore.instance.collection("labour").add({
                "labourName":labourName!,
                "labourWork":labourWork,
                "long":long,
                "lat":lat,

           });

}
  




 String? selectedChip;
 String? productName;
 String? price;
 String?   njm;
 String? accountNum;
    String? nami  ;
    
  final ImagePicker _picker = ImagePicker();
    var imageFile;
  //   void  selectImages()async {
  //   final XFile? images = await _picker.pickImage(source: ImageSource.gallery);

  //   if (images !=null) {
  //     // imagesList.addAll(images);
  //   }
  //   setState(() {

  //  _imageFile =  images;

  //   });
  //   imageFile = images!.path;
  //   update();
  // }
  User? userId;
     FirebaseFirestore firebaseRef =  FirebaseFirestore.instance;

  
List name= [];
List imagess = [];
List prices = [];
List <DocumentSnapshot> documents = [];

Future logins() async{
  // await getIDo();
final QuerySnapshot result =
    await FirebaseFirestore.instance.collection('account').where('accountNum', isEqualTo: 
    accountNum).get();
 documents = result.docs;
 update();
print(documents.length);
// print(userId!.uid);
if (documents.length > 0) { 
  loginName == "admin"?
Get.to(AdminPanel())   

:Get.to(LabourUpload())
;
    //    var ids = documents.first.id;
    // var  balanc  = documents.first["accountB"];

}

else{
  // Get.snackbar("titjjle", "jkkk");
  // Get.snackbar("False", "Login invalid number");
  print("object");
}

}








   Future<List?> productCat() async{
    name.clear();
    // imagess.clear();
    // prices.clear();
    await getIDo();
    QuerySnapshot  kilo =    await FirebaseFirestore.instance
      .collection("Category")
        .get();


    kilo.docs.map((e) {
         name.add(e["name"]) ;
        //  imagess.add(e["product image"]) ;
        //  prices.add(e["video"]) ;
        


        }).toList();
        update();
        print(name);
// print(imagess);
   }



     List notificationList = [];
List<String> bala = [];

   Future<List?> getCatgeories() async{
    bala.clear();
    await getIDo();
    QuerySnapshot  kilo =    await FirebaseFirestore.instance
        .collection("Category")
        .get();


    kilo.docs.map((e) {
         bala.add(e["name"]) ;

        }).toList();
        print(bala);

   }
getIDo()async{
  userId = await FirebaseAuth.instance.currentUser;
  update();
 print(userId);
}

 String tenNumberGenerated(){
  var rndnumber="";
  var rnd= new Random();
  for (var i = 0; i < 10; i++) {
  rndnumber = rndnumber + rnd.nextInt(9).toString();
  }
  print(rndnumber);
  return rndnumber;
}
  String dropDownValue ='Standard';
   String? _dropDownValue;


     Future<UploadTask?> uploadFilesPassport(XFile? files,context) async {
    await getIDo();
     String rand = await tenNumberGenerated();
 var uniqueKeys = firebaseRef.collection("users");
    var uniqueKey = firebaseRef.collection("users");
    if (files == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No file was selected'),
        ),
      );

      return null;
    }

    UploadTask uploadTask;

    // Create a Reference to the file
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('productImage') 
        .child('${rand}.jpg');

    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {'picked-file-path': files.path},
    );
    // EasyLoading.show();

    if (kIsWeb) {
      uploadTask = ref.putData(await files.readAsBytes(), metadata);
    } else {
      uploadTask = ref.putFile(io.File(files.path), metadata);

    await  uploadTask.whenComplete(() async {
        var uploadpaths = await uploadTask.snapshot.ref.getDownloadURL();
           FirebaseFirestore.instance.collection("product").add({
                "catName":selectedChip,
                "product image":uploadpaths,
                "name":productName,
                "video":price,

           });
              //  await SendMailss();
           Get.snackbar("Uploaded", "Upload successfully");
          //  Get.to(HomePage());
          // await   sendEmail();
          EasyLoading.dismiss();
        // Get.to(HomePage());
        
      });


    }
    
    // await ref.getDownloadURL().then((value) => updataIdCard(value));

    return Future.value(uploadTask);
  }

 List<UploadTask> _uploadTasks = [];



}