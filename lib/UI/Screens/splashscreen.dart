import 'dart:async';

import 'package:event_ease/UI/Screens/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    Timer(Duration(seconds: 2,),
        ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>
        loginpage ()))
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Color(0XFF2f9494), Colors.white],
          )
        ),



      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Wellcome' ,style: GoogleFonts.kalam(
                fontWeight: FontWeight.bold,fontSize: 45,color: Colors.black),),

            Image.asset('assets/images/event_easebg.png')
          ],
        ),
      ),
    ), );
  }
}
