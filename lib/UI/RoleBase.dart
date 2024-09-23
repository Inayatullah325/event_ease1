import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_ease/UI/Screens/ManagerUI/ManagerNavigationBar.dart';
import 'package:event_ease/UI/Screens/LoginSignupScreens/login_screen.dart';
import 'package:event_ease/UI/Screens/navigationbuttombarr.dart';
import 'package:event_ease/UI/Screens/LoginSignupScreens/signuppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCheck  {
  void checkUserRoleAndNavigate(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('User').doc(user.uid).get();

      String role = userDoc.get('role');

      if (role == 'manager') {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ManagerNavigationBar()));
      }
      else if (role == 'user'){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const navigationbuttombarr()));
      }
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const loginpage()));
    }
  }

  void checkUserRole(BuildContext context)async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? role = sp.getString('role');

    if (role == 'manager') {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ManagerNavigationBar()));
    }
    else if (role == 'user'){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const navigationbuttombarr()));
    }
  }


  void signInUser(BuildContext context){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => signup()));
  }


}