import 'package:event_ease/UI/Screens/login_screen.dart';
import 'package:flutter/material.dart';

class signup extends StatelessWidget {
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

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
       child:  Padding(
        padding: const EdgeInsets.all(8.0),
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
               //

             ],
           ),
         ),

            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> loginpage()));
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

        ]),
    ),
        ), );
  }
}
