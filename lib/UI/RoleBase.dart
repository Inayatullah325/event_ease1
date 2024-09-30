import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/LoginSignupScreens/login_screen.dart';
import 'Screens/LoginSignupScreens/signuppage.dart';
import 'Screens/ManagerUI/ManagerNavigationBar.dart';
import 'Screens/navigationbuttombarr.dart';

class AuthCheck {
  // Check the user's role from Firestore and navigate accordingly
  Future<void> checkUserRoleAndNavigate(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        String role = userDoc.get('role');

        if (role == 'manager') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const ManagerNavigationBar()),
          );
        } else if (role == 'user') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const navigationbuttombarr()),
          );
        } else {
          print("Unknown role: $role");
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const loginpage()),
        );
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const loginpage()),
      );
    }
  }

  // Check user role from shared preferences
  Future<void> checkUserRoleFromPreferences(BuildContext context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? role = sp.getString('role');

    if (role == 'manager') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const ManagerNavigationBar()),
      );
    } else if (role == 'user') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const navigationbuttombarr()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const loginpage()),
      );
    }
  }

  // Navigate to Sign-Up screen
  void navigateToSignUp(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>  SignupPage()),
    );
  }
}
