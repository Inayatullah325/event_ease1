import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ManagerProfile extends StatefulWidget {
  const ManagerProfile({super.key});

  @override
  State<ManagerProfile> createState() => _ManagerProfileState();
}

class _ManagerProfileState extends State<ManagerProfile> {
  bool isselected = false;
  bool isselected1 = false;
  bool isselected2 = false;
  bool isselected3 = false;
  bool isselected4 = false;
  bool isselected5 = false;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFFF5FCFC),
      appBar: AppBar(

        title: Text('Manager Profile',style: GoogleFonts.kalam(
            fontWeight: FontWeight.bold,fontSize: 22.sp,color: Colors.white),),
        backgroundColor: Color(0XFF2f9494),

        centerTitle: true,

      ),


      body: ListView(
        children:[ Column(

          children: [
            Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.28,
                  ),
                  Container(
                   // height: MediaQuery.of(context).size.height*0.23,

                    decoration: BoxDecoration(
                        color: Color(0XFFd1f2eb),
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(90),
                          bottomRight: Radius.circular(90),
                        )
                    ),

                  ),
                  Positioned(
                    left: 10,
                    right: 10,
                    top: 40,
                    child: Container(

                      height: MediaQuery.of(context).size.height*0.21,
                      decoration: BoxDecoration(
                        image:DecorationImage(fit: BoxFit.contain,image: AssetImage('assets/images/salwa1.jpeg',)),
                        color: Colors. white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black),
                      ),


                    ),
                  ),
                  Positioned(
                    top: 160,
                    right: 10,
                    left: 110,
                    child: Container(

                      height: MediaQuery.of(context).size.height*0.04,
                      child: Icon(Icons.camera_alt_outlined),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black),),


                    ),
                  ),

                ] ),
            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    //Name
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                              BorderSide(width: 2, color: Colors.black),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                            suffixIcon: Icon(Icons.edit),
                            prefixIcon: Icon(
                              Icons.drive_file_rename_outline,
                              color: Colors.black,
                            ),
                            hintText: 'Daniel Ritchie',
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: 'Name',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    //Contact number
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                              BorderSide(width: 2, color: Colors.black),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                            suffixIcon: Icon(Icons.edit),
                            prefixIcon: Icon(
                              Icons.location_on,
                              color: Colors.black,
                            ),
                            hintText: 'Anywhere North St 123',
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: 'Address',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    //Phone
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                              BorderSide(width: 2, color: Colors.black),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                            suffixIcon: Icon(Icons.edit),
                            prefixIcon: Icon(
                              Icons.phone_android,
                              color: Colors.black,
                            ),
                            hintText: '0321-1234567',
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: 'Contact Number',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      ),

                    ),
                    //Password
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        //keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                              BorderSide(width: 2, color: Colors.black),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                            suffixIcon: Icon(Icons.edit),
                            prefixIcon: Icon(
                              Icons.remove_red_eye_rounded,
                              color: Colors.black,
                            ),
                            hintText: 'Pakistan@123',
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: 'Password',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    //Team Member
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide:
                              BorderSide(width: 2, color: Colors.black),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                            suffixIcon: Icon(Icons.edit),
                            prefixIcon: Icon(
                              Icons.group,
                              color: Colors.black,
                            ),
                            hintText: 'Enter the number of team members...',
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: 'Number of Members',
                            labelStyle:
                            TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    //Description
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.black,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                              borderSide: BorderSide(
                                  width: 2, color: Colors.black),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                            suffixIcon: Icon(Icons.edit),
                            prefixIcon: Icon(
                              Icons.description,
                              color: Colors.black,
                            ),
                            hintText: 'Enter a brief description about your services...',
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: 'Description',
                            labelStyle:
                            TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text("Which Services do you offer? ",
                        style: GoogleFonts.kalam(fontSize: 20.sp,fontWeight: FontWeight.bold),)),
                    ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                       children: [
                         Row(
                           children: [
                             Checkbox(

                                 activeColor: Colors.black,
                                 checkColor: Colors.white,
                                 value:isselected, onChanged: (value){
                               setState(() {
                                 isselected=value!;
                               });
                             }),
                             Text('Marrige'),
                           ],

                         ),
                         Row(
                           children: [
                             Checkbox(

                                 activeColor: Colors.black,
                                 checkColor: Colors.white,
                                 value:isselected1, onChanged: (value){
                               setState(() {
                                 isselected1=value!;
                               });
                             }),
                             Text('Engagement'),
                           ],

                         ),

                       ],
                     ),
                   ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Checkbox(

                                  activeColor: Colors.black,
                                  checkColor: Colors.white,
                                  value:isselected2, onChanged: (value){
                                setState(() {
                                  isselected2=value!;
                                });
                              }),
                              Text('Birthday'),
                            ],

                          ),
                          Row(
                            children: [
                              Checkbox(

                                  activeColor: Colors.black,
                                  checkColor: Colors.white,
                                  value:isselected3, onChanged: (value){
                                setState(() {
                                  isselected3=value!;
                                });
                              }),
                              Text('Anniversary'),
                            ],

                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Checkbox(

                                  activeColor: Colors.black,
                                  checkColor: Colors.white,
                                  value:isselected4, onChanged: (value){
                                setState(() {
                                  isselected4=value!;
                                });
                              }),
                              Text('Get-Togethers'),
                            ],

                          ),
                          Row(
                            children: [
                              Checkbox(

                                  activeColor: Colors.black,
                                  checkColor: Colors.white,
                                  value:isselected5, onChanged: (value){
                                setState(() {
                                  isselected5=value!;
                                });
                              }),
                              Text('Greduation parties'),
                            ],

                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Save Button
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Container(
                    height: MediaQuery.of(context).size.height*0.08,
                    width: MediaQuery.of(context).size.width*0.4,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff7D7D7D),
                          spreadRadius: -1,
                          blurRadius: 7,
                          offset: Offset(0, 10),
                        )
                      ],
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0XFF2f9494),
                    ),
                    child: Center(
                        child: Text(
                          "Save",
                          style: GoogleFonts.kalam(
                             // fontFamily: "Bebas",
                              fontSize: 22.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ))),
              ),

            ),
          ],
        ),
        ],
      ),
    );
  }
}

