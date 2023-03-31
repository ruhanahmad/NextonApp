import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nextonapp/controller.dart';

import '../String File/image_string.dart';
import 'payment_img_select_constant.dart';
import 'populare_container_constant.dart';

class FoodCategoryContainer extends StatefulWidget {
  const FoodCategoryContainer({Key? key}) : super(key: key);

  @override
  State<FoodCategoryContainer> createState() => _FoodCategoryContainerState();
}

class _FoodCategoryContainerState extends State<FoodCategoryContainer> {

  @override
  void initState() {
    userController.productCat();
    // TODO: implement initState
    super.initState();
  }
  UserController userController = Get.put(UserController());
  RxString image1 = payment_img_1.obs;
  RxInt _selectedIndex = 0.obs;
  String? nami;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:  FirebaseFirestore.instance.collection('Category').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
           if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final docs = snapshot.data!.docs;

       
    return Container(
        height: 50,
        width: Get.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: docs.length,
          itemBuilder:(BuildContext context,int i){
        //  userController.nami  = docs[0]["name"];
        //  userController.update();
         return Padding(
           padding: const EdgeInsets.only(left:8.0),
           child: InkWell(
                          onTap: ()async {
                           setState(() {
                               _selectedIndex.value = i;
                              userController.nami = docs[i]["name"];
                              print(userController.nami);
                             
                            
                           });
                             userController.update();
    
                        PopulareContainer();
                           
                            // image1.value = e.value.assetsImage;
                          },
                          child: Container(
                            height: 109.h,
                            width: 55.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                // border: Border.all(color: Colors.grey),
                                border: Border.all(
                                  color: (_selectedIndex.value == i)
                                      ? Colors.orange
                                      : Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(50.r)),
                            child: Container(
                              height: 86.98.h,
                              width: 64.96.w,
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  // color: Colors.green.shade50,
                                  color: (_selectedIndex.value == i)
                                      ? Color(0XFFA9E88B)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(50.r)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                 
                                  // Image.network(userController.imagess[i],
                                  //     height: 35.h, width: 35.w),
                                  Text(docs[i]["name"],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400)),
                                ],
                              ),
                            ),
                          ),
                        ),
         );
        } ),
      );
      },
  
    );
            // .toList(),
    //   ),
    // );
  }
}
