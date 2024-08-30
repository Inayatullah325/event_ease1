import 'package:event_ease/UI/Screens/Dashboard.dart';
import 'package:event_ease/UI/Screens/navigationbuttombarr.dart';
import 'package:event_ease/UI/Screens/signuppage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _eventeaseState();
}

class _eventeaseState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [Color(0XFF2f9494), Colors.white],
    )
    ),

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
                                  Icons.email,
                                  color: Colors.black,
                                ),
                                hintText: 'abc123@gmail.com',
                                hintStyle: TextStyle(color: Colors.grey),
                                labelText: 'Email',
                                labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                        //Phone

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
                        //

                      ],
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=> navigationbuttombarr()));
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
                                  "Login",
                                  style: TextStyle(
                                      fontFamily: "Bebas",
                                      fontSize: 25,
                                      color: Colors.white),
                                ))),
                      ),
                    ),

                  ),

            

                  Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(onPressed: (){}, child: Text('Forgot Password')),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont have an account?"),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => signup()));
                      }, child: Text('Sin up')),
                    ],
                  ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}
