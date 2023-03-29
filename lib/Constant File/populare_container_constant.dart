import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:nextonapp/Ui/singal_products_screen.dart';
import 'package:nextonapp/controller.dart';

import '../String File/image_string.dart';
import '../String File/text_string.dart';

class PopulareContainer extends StatefulWidget {
  const PopulareContainer({super.key});
  

  @override
  State<PopulareContainer> createState() => _PopulareContainerState();
}








class _PopulareContainerState extends State<PopulareContainer> {

// @override
//   void initState() {
//     //konsa code chalana hay
//     //ap ny mapbox use kia h ?
//     //ya mai ny vysy he pcha tha v dsry project ka tha  
//     yearsss();
//     // TODO: implement initState
//     super.initState();
//   }

//   yearsss()async{
// await Get.snackbar("title", "message",duration: Duration(seconds: 4));

//   }


  @override
  Widget build(BuildContext context) {
 

     
    UserController userController = Get.put(UserController());
    return Container(
      // color: Colors.red,
      height: 300.h,
      child: 
      StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('product').where("catName", isEqualTo: userController.nami).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final docs = snapshot.data!.docs;
          return Container(
            height: 200.h,
            width: 500.w,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: docs.length,
              itemBuilder: (BuildContext context, int index) {
                final data = docs[index];
                return 
                    InkWell(
        onTap: ()async{
await alerting(data['product image'],data["name"],data["video"]);
      //  showProductDetails(context);
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => singal_products_screen(
          //             image_location: "image_location", name: "name")));
        },
        child: 
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            height: 260.h,
            width: 100.w,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
        //         Image.network(
        //   'https://example.com/images/image.png',
        //   loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
        //     if (loadingProgress == null) {
        //       return child;
        //     }
        //     return CircularProgressIndicator(
        //       value: loadingProgress.expectedTotalBytes != null
        //           ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
        //           : null,
        //     );
        //   },
        // ),
               Image.network(
                  data['product image'],
                  height: 112.h,
                  width: 170.w,
                ),
                SizedBox(height: 10.h),
                Container(
                  // color: Colors.yellow,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    data["name"],
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 15.sp),
                  ),
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  width: 250,
                  child: Text(
                    data["video"],
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp),
                  ),
                ),
                SizedBox(height: 12.h),
                Center(
        child: WhatsAppButton(
          phoneNumber: '+923226662204',
                    
          message: 'Aslamo Alikum ! i want this product ${data["name"]} ',
        ),
      )

      ,
                // Row(
                //   children: [
                //     Icon(
                //       Icons.star,
                //       color: Color(0XFFF5A62E),
                //       size: 20.sp,
                //     ),
                //     SizedBox(width: 5.w),
                //     Text(
                //       '4+',
                //       style: TextStyle(
                //           color: Colors.black,
                //           fontWeight: FontWeight.w500,
                //           fontSize: 13.sp),
                //     ),
                //     Spacer(),
                //     Icon(
                //       Icons.favorite,
                //       color: Colors.red,
                //       size: 20.sp,
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ));
                // ListTile(
                //   title: Text(data['name'],style: TextStyle(color: Colors.black),),
                //   subtitle: Text("data['description']"),
                // );
              },
            ),
          );
        },
      ),


//--------------------------------------------------------------//



      // ListView(
      //   scrollDirection: Axis.horizontal,
      //   children: [
      //     Category(
      //       image_location: food_5,
      //       name: Big_cheese_burger,
      //       description: Big_cheese_burger_sub,
      //     ),
      //     Category(
      //       image_location: food_5,
      //       name: Medium_cheese_burger,
      //       description: Big_cheese_burger_sub,
      //     ),
      //     Category(
      //       image_location: food_5,
      //       name: Big_cheese_burger,
      //       description: Big_cheese_burger_sub,
      //     ),
      //     Category(
      //       image_location: food_5,
      //       name: Medium_cheese_burger,
      //       description: Big_cheese_burger_sub,
      //     ),
      //   ],
      // ),
    );
  }

   Future<void>? alerting(image,name,price){
    showDialog(context: context, builder: (context){
      return     AlertDialog(
        content: new
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
               Image.network(
                  image,
                  height: 112.h,
                  width: 170.w,
                ),
                SizedBox(height: 10.h),
                Container(
                  // color: Colors.yellow,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 15.sp),
                  ),
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  width: 250,
                  child: Text(
                 "Price "+   price,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp),
                  ),
                ),
          ],
        ),
      );
    });
  }

}

class Category extends StatelessWidget {
  final String image_location;
  final String name;
  final String description;

  Category({
    required this.image_location,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return 
    InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => singal_products_screen(
                      image_location: image_location, name: name)));
        },
        child: 
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            height: 260.h,
            width: 200.w,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12.h),
                Image.asset(
                  image_location,
                  height: 112.h,
                  width: 170.w,
                ),
                SizedBox(height: 10.h),
                Container(
                  // color: Colors.yellow,
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    name,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 15.sp),
                  ),
                ),
                SizedBox(height: 8.h),
                SizedBox(
                  width: 250,
                  child: Text(
                    description,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp),
                  ),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Color(0XFFF5A62E),
                      size: 20.sp,
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      '4+',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                    ),
                    Spacer(),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 20.sp,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
  

}

class WhatsAppButton extends StatelessWidget {
  final String phoneNumber;
  final String message;

  const WhatsAppButton({
    required this.phoneNumber,
    this.message = '',
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _launchWhatsApp,
      child: Text('WhatsApp'),
    );
  }

  void _launchWhatsApp() async {
    final url = 'https://wa.me/$phoneNumber/?text=${Uri.encodeFull(message)}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  } 
}


