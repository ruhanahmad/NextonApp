import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nextonapp/Constant%20File/populare_container_constant.dart';
import 'package:nextonapp/controller.dart';

class AutocompleteWithFirebase extends StatefulWidget {
  @override
  _AutocompleteWithFirebaseState createState() => _AutocompleteWithFirebaseState();
}

class _AutocompleteWithFirebaseState extends State<AutocompleteWithFirebase> {
  TextEditingController _textEditingController = TextEditingController();
  List<String> _suggestions = [];
  List labourImages = [];
  List labourWork = [];
  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow,
        body: Column(
          children: [
    
              //  TextFormField(
              //     decoration: new InputDecoration(
              //     labelText: "Enter Email",
              //     fillColor: Colors.white,
              //     border: new OutlineInputBorder(
              //       borderRadius: new BorderRadius.circular(25.0),
              //       borderSide: new BorderSide(
              //       ),
              //     ),
              //     //fillColor: Colors.green
              //     ),
              //     validator: (val) {
              //     if(val!.length==0) {
              //       return "Email cannot be empty";
              //     }else{
              //       return null;
              //     }
              //     },
              //     keyboardType: TextInputType.emailAddress,
              //     style: new TextStyle(
              //     fontFamily: "Poppins",
              //     ),
              //   ),
          TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(
                
                labelText: 'Search',
                hintText:"Search",
                suffixIcon: IconButton(
                  onPressed: () => _textEditingController.clear(),
                  icon: Icon(Icons.clear),
                ),
              ),
              onChanged: (query) => _updateSuggestions(query),
            ),
            SizedBox(height: 20),
            _textEditingController.text.length == 0 ?  Text("data") :
                                    Padding(
                                      padding: const EdgeInsets.only(top:20.0),
                                      child: Container( 
                                        // color: Colors.white,
                                                      height: MediaQuery.of(context).size.width * 0.35,
                                                      width: MediaQuery.of(context).size.width +30,
                                                      child: Row(
                                                             children: <Widget> [
                                    
                                                              Expanded(
                                    child: 
                                    ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                      itemCount:_suggestions.length ,
                                      itemBuilder:(BuildContext context, index) {
                                        final suggestion = _suggestions[index];
                                        final image = labourImages[index];
                                        final work = labourWork[index];
                                        return
       Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 12.h),
              
                           Image.network(
                              image,
                              height: 302.h,
                              width: 200.w,
                              fit: BoxFit.contain,
                                  loadingBuilder: (BuildContext context, Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes != null
                                        ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 10.h),
                            Container(
                              // color: Colors.yellow,
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                suggestion,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15.sp),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              work,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.sp),
                            ),
                            SizedBox(height: 12.h),
                            Center(
                      child: WhatsAppButton(
                        phoneNumber: '+923226662204',
                                
                        message: 'Aslamo Alikum ! i want to hire this person ${suggestion} ',
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
                      );
                                          
                                  // Padding(
                                  //   padding: const EdgeInsets.only(top:8.0),
                                  //   child: Container(
                                  //     height: 70,
                                  //     width: Get.width,
                                  //     color: Colors.yellow,
                                  //     child: ListTile(
                                  //         //        onTap: () async{
                                                
                                  //         //        _textEditingController.text = "";
                                  //         //         // List<Location> locations = await locationFromAddress("Pakistan");
                                  //         //         // print(locations.last.longitude);
                                  //         // userController.hintText = _suggestions[index];
                                           
                                  //         //   userController.update();
                                  //         //     setState(() {
                                                
                                  //         //     });
                                  //         //      },
                                  //           contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                  //           leading: 
                                  //          Container(
                                  //            height: 70,
                                  //            width: 70,
                                  //            child: 
                                  //            image == null ? Text("loading") :
                                  //            Image.network(
                                  //                            image,
                                  //                            height: 42.h,
                                  //                            width: 40.w,
                                  //                                loadingBuilder: (BuildContext context, Widget child,
                                  //                                ImageChunkEvent? loadingProgress) {
                                  //                              if (loadingProgress == null) return child;
                                  //                              return Center(
                                  //                                child: CircularProgressIndicator(
                                  //                                  value: loadingProgress.expectedTotalBytes != null
                                  //                                      ? loadingProgress.cumulativeBytesLoaded /
                                  //                                          loadingProgress.expectedTotalBytes!
                                  //                                      : null,
                                  //                                ),
                                  //                              );
                                  //                            },
                                  //                          ),
                                  //          ),
                                  //           title:
                                  //       Text(suggestion,style: TextStyle(color: Colors.black),),
                                  //           // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
                                    
                                  //           subtitle: Row(
                                  //             children: <Widget>[
                                  //               Icon(Icons.linear_scale, color: Colors.yellowAccent),
                                  //               Text(" Intermediate", style: TextStyle(color: Colors.white))
                                  //             ],
                                  //           ),
                                  //           trailing:
                                  //               Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)),
                                  //   ),
                                  // );
    
    
                                      }) )
                                   
                                    
                                                        ]
                                                             )
                                                      ),
                                    ),
                                    _textEditingController.text == ""?
                                        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('labour').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final docs = snapshot.data!.docs;
            return Container(
              height: 300.h,
              width: 500.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final data = docs[index];
                  return 
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
              
                             Image.network(
                                data['labourImage'],
                                height: 112.h,
                                width: 170.w,
                                    loadingBuilder: (BuildContext context, Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress.cumulativeBytesLoaded /
                                              loadingProgress.expectedTotalBytes!
                                          : null,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(height: 10.h),
                              Container(
                                // color: Colors.yellow,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  data["labourName"],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15.sp),
                                ),
                              ),
                              SizedBox(height: 8.h),
                              SizedBox(
                                width: 200,
                                child: Text(
                                  data["labourWork"],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp),
                                ),
                              ),
                              SizedBox(height: 12.h),
                              Center(
                      child: Container(
                        height: 40,
                        width: 120,
                        child: WhatsAppButton(
                          
                          phoneNumber: '+923226662204',
                                    
                          message: 'Aslamo Alikum ! i want to hire this person ${data["labourName"]} ',
                        ),
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
                      );
                
                },
              ),
            );
          },
        ): Text(""),
            //         _textEditingController.text.length == 0 ?  Text("data") :
    
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: _suggestions.length,
            //     itemBuilder: (context, index) {
            //       final suggestion = _suggestions[index];
            //       return ListTile(
            //         onTap: () {
            //           _textEditingController.text = "";
            //            userController.hintText = _suggestions[index];
                           
            //                 userController.update();
            //         },
            //         title: Text(suggestion,style: TextStyle(color: Colors.black),));
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void _updateSuggestions(String query) {
    labourImages.clear();
    if (query.isEmpty) {
      setState(() => _suggestions = []);
    } else {
      FirebaseFirestore.instance
          .collection('labour')
          .orderBy('labourName')
          .startAt([query])
          .endAt([query + '\uf8ff'])
          .get()
          .then((snapshot) {
        final List<String> suggestions = [];
        snapshot.docs.forEach((doc) {
          suggestions.add(doc.get('labourName'));
          labourImages.add(doc.get('labourImage'));
          labourWork.add(doc.get('labourWork'));

        });
        setState(() => _suggestions = suggestions);
      });
    }
  }
}



// import 'package:flutter/material.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:autocomplete_textfield/autocomplete_textfield.dart';
// import 'package:nextonapp/constants/constants.dart';
// class MyAutoCompleteTextField extends StatefulWidget {
//   @override
//   _MyAutoCompleteTextFieldState createState() => _MyAutoCompleteTextFieldState();
// }

// class _MyAutoCompleteTextFieldState extends State<MyAutoCompleteTextField> {
//   final TextEditingController _controller = TextEditingController();

//   final CollectionReference keywordsCollection =
//     FirebaseFirestore.instance.collection('labour');
//  List<dynamic> suggestionsss = [];
//   Future<List<String>> searchKeywords(String searchTerm) async {
//   final result = await keywordsCollection
//       .where('labourName', arrayContains: searchTerm)
//       .get();
//   final suggestions = result.docs.map((doc) => doc.id).toList();
//   return suggestions;
// }



// @override
// void initState() {
//   super.initState();
//   _controller.addListener(() {
//     final searchTerm = _controller.text.toLowerCase();
//     searchKeywords(searchTerm).then((suggestions) {
//       setState(() {
//         this.suggestionsss = suggestions;
//       });
//     });
//   });
   
// }
//     final _formKey = GlobalKey<AutoCompleteTextFieldState>();

//   // Future<void> _getSuggestions() async {
//   //   final collectionReference = FirebaseFirestore.instance.collection('labour');
//   //   final querySnapshot = await collectionReference.get();

//   //   final suggestions = querySnapshot.docs
//   //       .map((doc) => doc.data()['labourName'])
//   //       .toList();

//   //   setState(() {
//   //     _suggestions = suggestions ;
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return 
//     Scaffold(
//       backgroundColor: Colors.red,
//     body: Container(
//       height: 700,
//       width: 700,
//       child: Column(
//         children: [
//              Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child:
//                        TextFormField(
//                         controller: _controller,
//                         // onChanged: (value) {
//                         //   userController.price = value;
//                         // },
//                         decoration: InputDecoration(
//                             contentPadding:
//                                 const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
//                             filled: true,
//                             fillColor: kPrimaryColor.withOpacity(0.3),
//                             labelText: 'Price',
//                             labelStyle: kFormTextStyle,
//                             border: InputBorder.none,
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15.0),
//                               borderSide: const BorderSide(color: Colors.white),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15.0),
//                               borderSide:  BorderSide(color: kPrimaryColor),
//                             )),
//                         keyboardType: TextInputType.text,
//                         obscureText: false,
//                         validator: (String? value) {
//                           if (value!.isEmpty) {
//                             return 'Please enter an price';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: suggestionsss.length,
//               itemBuilder: (context, index) => ListTile(
//                 title: 
//                 // Text(suggestionsss[index]["labourName"].toString()),
//                 Text(suggestionsss[index]["labourName"],style: TextStyle(color: Colors.black),)
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
//     // Scaffold(
//     //   backgroundColor: Colors.red,
//     //   body: AutoCompleteTextField(
//     //     itemFilter: (suggestion, query) {
//     //       return true;
//     //     },
//     //     itemSorter: (a, b) {
//     //       return 0;
//     //     },
//     //     itemBuilder: (context, suggestion) {
//     //      return suggestion ;
//     //     },
//     //     key: _formKey,
//     //     itemSubmitted: (data) {
//     //       data = "";
//     //     },
//     //     controller: _controller,
//     //     suggestions: _suggestions,
//     //     decoration: InputDecoration(
//     //       hintText: 'Type something...',
//     //       labelStyle: TextStyle(color: Colors.black)
//     //     ),
//     //   ),
//     // );
//   }
// }
