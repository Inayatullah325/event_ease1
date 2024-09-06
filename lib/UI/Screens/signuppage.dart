import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_ease/UI/Screens/Dashboard.dart';
import 'package:event_ease/UI/Screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    TextEditingController NameController = TextEditingController();
    TextEditingController EmailController = TextEditingController();
    TextEditingController PhoneController = TextEditingController();
    TextEditingController PasswordController = TextEditingController();

    User? userid = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [Color(0XFF2f9494), Colors.white],
        )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/eventbg.png'),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: NameController,
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
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        //Contact number
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: EmailController,
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
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                hintText: 'abc123@gmail.com',
                                hintStyle: TextStyle(color: Colors.grey),
                                labelText: 'Email',
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        //Phone
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: PhoneController,
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
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        //Password
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: PasswordController,
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
                                labelStyle:
                                    TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        //
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        child: GestureDetector(
                          onTap: () async {
                            // var loginEmail =
                            //     EmailController.text.toString().trim();
                            // var loginPassword =
                            //     PasswordController.text.toString().trim();

                            try {
                              await FirebaseAuth.instance.createUserWithEmailAndPassword
                                (email:EmailController.text.trim(), password: PasswordController.text.trim()).then((value) {
                                User? currentuser = FirebaseAuth.instance.currentUser;
                                FirebaseFirestore.instance.collection('User').doc(currentuser!.uid).set(
                                    {
                                      'username':NameController.text.toString().trim(),
                                      'useremail': EmailController.text.toString().trim(),
                                      'phoeno' : PhoneController.text.toString().trim(),
                                      'userpassword' : PasswordController.text.toString().trim(),
                                      'image' : '',
                                      'created At' : DateTime.now(),
                                      'user id' : currentuser!.uid,
                                    });
                              }).then((value) {

                                Navigator.push(context, MaterialPageRoute(builder: (ctx) => DashBoard()));
                              });

                            } catch (e) {
                              print(e);
                            }
                            Navigator.push(context,
                               MaterialPageRoute(builder: (_) => loginpage()));
                          },
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
                                "Signup",
                                style: TextStyle(
                                    fontFamily: "Bebas",
                                    fontSize: 25,
                                    color: Colors.white),
                              ))),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
