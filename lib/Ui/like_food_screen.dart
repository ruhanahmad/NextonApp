import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:nextonapp/Ui/singal_products_screen.dart';
import 'package:nextonapp/controller.dart';

import '../String File/image_string.dart';
import '../String File/text_string.dart';

class PopulareContainerss extends StatefulWidget {
  const PopulareContainerss({super.key});
  

  @override
  State<PopulareContainerss> createState() => _PopulareContainerssState();
}


// @override
// void initState() {
  
//   super.initState();
  
// }

class _PopulareContainerssState extends State<PopulareContainerss> {
  @override
  Widget build(BuildContext context) {
    UserController userController = Get.put(UserController());
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('product').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final docs = snapshot.data!.docs;
        return SingleChildScrollView(
              

          child: 
          Container(
            height:900,
            // width: 300,
            child: GridView.builder(
            itemCount:docs.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              // childAspectRatio: (2 / 1),
            ),
            itemBuilder: (BuildContext context, int index) {
              final data = docs[index];
              return GestureDetector(
                // onTap:(){
                //   Navigator.of(context).pushNamed(RouteName.GridViewCustom);
                // },
                child:Container(
                //  color: 
                //  RandomColorModel().getColor(),
                 child: Column(
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: [
                  Image.network(
                    data['product image'],
                    height: 112.h,
                    width: 170.w,
                  ),
                 Text(
                      data["name"],
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 15.sp),
                    ),
                        Text(
                      data["video"],
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp),
                    ),
                         Center(
                    child: WhatsAppButton(
                      phoneNumber: '+923059604250',
                      
                      message: 'Aslamo Alikum ! i want this product ${data["name"]} ',
                    ),
                  )
                 
            ],
                  ),
                ),
              );
            },
          ),
          )
          
          
          
          
          // Container(
          //   height: 500,
          //   width: 200,
          //   child: GridView.builder(
          //     // scrollDirection: Axis.horizontal,
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          //     itemCount: docs.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       final data = docs[index];
          //       return 
          //           InkWell(
          //         onTap: () {
          //           // Navigator.push(
          //           //     context,
          //           //     MaterialPageRoute(
          //           //         builder: (context) => singal_products_screen(
          //           //             image_location: "image_location", name: "name")));
          //         },
          //         child: 
          //         Padding(
          //           padding: const EdgeInsets.only(top:30,left: 20),
          //           child: Container(
          //   height: 700.h,
          //   width: 100.w,
          //   padding: EdgeInsets.all(10),
          //   decoration: BoxDecoration(color: Colors.white),
          //   child: 
          //   Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       SizedBox(height: 12.h),
          //         //         Image.network(
          //         //   'https://example.com/images/image.png',
          //         //   loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          //         //     if (loadingProgress == null) {
          //         //       return child;
          //         //     }
          //         //     return CircularProgressIndicator(
          //         //       value: loadingProgress.expectedTotalBytes != null
          //         //           ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
          //         //           : null,
          //         //     );
          //         //   },
          //         // ),
          //      Image.network(
          //         data['product image'],
          //         height: 112.h,
          //         width: 170.w,
          //       ),
          //       SizedBox(height: 10.h),
          //       Container(
          //         // color: Colors.yellow,
          //         width: MediaQuery.of(context).size.width,
          //         child: 
          //         Text(
          //           data["name"],
          //           style: TextStyle(
          //               color: Colors.black,
          //               fontWeight: FontWeight.w700,
          //               fontSize: 15.sp),
          //         ),
          //       ),
          //       SizedBox(height: 8.h),
          //      Container(
                
          //         child: 
          //         Text(
          //           data["video"],
          //           style: TextStyle(
          //               color: Colors.black,
          //               fontWeight: FontWeight.w500,
          //               fontSize: 13.sp),
          //         ),
          //       ),
          //       SizedBox(height: 12.h),
          //       Center(
          //         child: WhatsAppButton(
          //           phoneNumber: '+923059604250',
                    
          //           message: 'Aslamo Alikum ! i want this product ${data["name"]} ',
          //         ),
          //       )
          //       // Row(
          //       //   children: [
          //       //     Icon(
          //       //       Icons.star,
          //       //       color: Color(0XFFF5A62E),
          //       //       size: 20.sp,
          //       //     ),
          //       //     SizedBox(width: 5.w),
          //       //     Text(
          //       //       '4+',
          //       //       style: TextStyle(
          //       //           color: Colors.black,
          //       //           fontWeight: FontWeight.w500,
          //       //           fontSize: 13.sp),
          //       //     ),
          //       //     Spacer(),
          //       //     Icon(
          //       //       Icons.favorite,
          //       //       color: Colors.red,
          //       //       size: 20.sp,
          //       //     ),
          //       //   ],
          //       // )
          //     ],
          //   ),
          //           ),
          //         ));
          //       // ListTile(
          //       //   title: Text(data['name'],style: TextStyle(color: Colors.black),),
          //       //   subtitle: Text("data['description']"),
          //       // );
          //     },
          //   ),
          // ),
        );
      },
    );
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
class RandomColorModel {
  Random random = Random();
  Color getColor() {
    return Color.fromARGB(random.nextInt(300), random.nextInt(300),
        random.nextInt(300), random.nextInt(300));
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
