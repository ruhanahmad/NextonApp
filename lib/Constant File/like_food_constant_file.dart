import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:nextonapp/Ui/singal_products_screen.dart';

import '../String File/image_string.dart';
import '../String File/text_string.dart';

class LikeContainer extends StatelessWidget {
  const LikeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      // height: 260.h,

      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Row(
            children: [
              Category(
                image_location: food_5,
                name: Big_cheese_burger,
                description: Big_cheese_burger_sub,
              ),
              Spacer(),
              Category(
                image_location: food_5,
                name: Medium_cheese_burger,
                description: Big_cheese_burger_sub,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Category(
                image_location: food_5,
                name: Medium_cheese_burger,
                description: Big_cheese_burger_sub,
              ),
              Spacer(),
              Category(
                image_location: food_5,
                name: Big_cheese_burger,
                description: Big_cheese_burger_sub,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Category(
                image_location: food_5,
                name: Big_cheese_burger,
                description: Big_cheese_burger_sub,
              ),
              Spacer(),
              Category(
                image_location: food_5,
                name: Medium_cheese_burger,
                description: Big_cheese_burger_sub,
              ),
            ],
          ),
        ],
      ),
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
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => singal_products_screen(
                        image_location: image_location, name: name)));
          },
          child: Container(
            height: 260.h,
            width: 170.w,
            padding: EdgeInsets.all(8),
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
                Text(
                  name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp),
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
          )),
    );
  }
}
