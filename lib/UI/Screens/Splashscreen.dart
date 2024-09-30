import 'dart:async';


import 'package:event_ease/Provider/dashboard_provider.dart';
import 'package:event_ease/UI/RoleBase.dart';
import 'package:event_ease/UI/Screens/LoginSignupScreens/signuppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'LoginSignupScreens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   final AuthCheck authCheck = AuthCheck();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      final user = FirebaseAuth.instance.currentUser;
       if (user != null) {
        authCheck.checkUserRoleAndNavigate(context);
      } else
      {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const loginpage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Color(0XFF2f9494), Colors.white],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Welcome',
                style: GoogleFonts.kalam(
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                  color: Colors.black,
                ),
              ),
              Image.asset('assets/images/event_easebg.png'),
            ],
          ),
        ),
      ),
    );
  }
}
