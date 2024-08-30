import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     // backgroundColor: Color(0XFFABD0BC),
      appBar: AppBar(

        title: Text('My Profile',style: GoogleFonts.kalam(
            fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white),),
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
   // height: MediaQuery.of(context).size.height*0.21,

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
                //name
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
                          BorderSide(width: 2, color: Colors.green),
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
              ],
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Container(
                width: 200,
                height: 60,
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
                      style: TextStyle(
                          fontFamily: "Bebas",
                          fontSize: 25,
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
