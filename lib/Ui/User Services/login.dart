
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nextonapp/constants/constants.dart';
import 'package:nextonapp/controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class City {
  
  final String name;

  City( this.name);
}
class loginLogin extends StatefulWidget {
  const loginLogin({super.key});

  @override
  State<loginLogin> createState() => _loginLoginState();
}

class _loginLoginState extends State<loginLogin> {
    

  
  

   
  


  @override
  Widget build(BuildContext context) {
    
    return
    GetBuilder<UserController>(
      init: UserController(),
      builder: (_){
   return  Scaffold(
appBar: AppBar(
  title: 
IconButton(onPressed: (){
//  userController.getCatgeories();
}, icon: Icon(Icons.access_alarm_sharp)),),

      body: SafeArea(
        
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
        
        
          //   Wrap(
          //     children: List<Widget>.generate(userController.bala.length, (int index) {
          // return ChoiceChip(
          //   label: Text(userController.bala[index].toString()),
          //   selected: _selectedIndex == index,
          //   onSelected: (bool selected) {
          //                 _onChipSelected(userController.bala[index]);
          //     setState(() {
          //       _selectedIndex = selected ? index : -1;
                
          //     });
          //     print(_selectedIndex);
          //     print(_selectedChip);
          //   },
            
          // );
          //     }),
          //   ),
            
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child:
                     TextFormField(
                      onChanged: (value) {
                        _.accountNum = value;
                        _.update();
                      },
                      decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
                          filled: true,
                          fillColor: kPrimaryColor.withOpacity(0.3),
                          labelText: 'account #',
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
                     GestureDetector(
                      onTap: ()async{
await _.logins();
                      },
                       child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                     
                        ),
                        
                        ),
                     ),

                  //       Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //   child:
                  //    TextFormField(
                  //     onChanged: (value) {
                  //       userController.price = value;
                  //     },
                  //     decoration: InputDecoration(
                  //         contentPadding:
                  //             const EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
                  //         filled: true,
                  //         fillColor: kPrimaryColor.withOpacity(0.3),
                  //         labelText: 'Price',
                  //         labelStyle: kFormTextStyle,
                  //         border: InputBorder.none,
                  //         enabledBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           borderSide: const BorderSide(color: Colors.white),
                  //         ),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(15.0),
                  //           borderSide:  BorderSide(color: kPrimaryColor),
                  //         )),
                  //     keyboardType: TextInputType.text,
                  //     obscureText: false,
                  //     validator: (String? value) {
                  //       if (value!.isEmpty) {
                  //         return 'Please enter an price';
                  //       }
                  //       return null;
                  //     },
                  //   ),
                  // ),
               
        
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
                //  if (_imageFile != null) ...[
                //             Image.file(
                //               width:200,
                //               height:200,
                //               File(
                                
                //                 _imageFile!.path)),
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: <Widget>[
                //                 // ElevatedButton(
                //                 //   child: Icon(Icons.crop),
                //                 //   onPressed: _cropImage,
                //                 // ),
                //                 ElevatedButton(
                //               style: ElevatedButton.styleFrom(primary: Color(0xFF9D0105),),
                //                   child: Icon(Icons.refresh,),
                //                   onPressed: _clear,
                //                 ),
                //                                             ElevatedButton(
                //               style: ElevatedButton.styleFrom(primary: Color(0xFF9D0105),),
                //                   child: Icon(Icons.upload_file,),
                //                   onPressed:()async{
                //               await       userController.uploadFilesPassport(_imageFile,context);
                //                   },
                //                 ),
            
              //                         InkWell(
              //                           onTap:  
              // // alertVideoAfter,    
              //  (){
        
              //  }, 
                                  
              //                         child:   Container(
              //                               height: 39,
              //                               width:63,
              //                               decoration: BoxDecoration(
              //                                 borderRadius: BorderRadius.all(Radius.circular(7)),
              //                                   color: Color(0xFF9D0105),
              //                                   image: DecorationImage(image: AssetImage("assets/4.png"),fit: BoxFit.cover)),
              //                             ),
              //                         ),
          
                          //     ],
                          //   ),
            
                          //   // Uploader(file: _imageFile)
                          // ],
              
                 
          ],),),
        ),
      ),
    );
    });
 
  }
}