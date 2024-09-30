import 'package:event_ease/UI/RoleBase.dart';
import 'package:event_ease/UI/Screens/Dashboard.dart';
import 'package:event_ease/UI/Screens/LoginSignupScreens/ForgotPassword.dart';
import 'package:event_ease/UI/Screens/ManagerUI/ManagerNavigationBar.dart';
import 'package:event_ease/UI/Screens/navigationbuttombarr.dart';
import 'package:event_ease/UI/Screens/LoginSignupScreens/signuppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _eventeaseState();
}

class _eventeaseState extends State<loginpage> {

  TextEditingController NameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  User? userid=FirebaseAuth.instance.currentUser;


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
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Image.asset('assets/images/eventbg.png'),
                ),
                  Container(
                    child: Column(
                      children: [
                        //Name
                        // Padding(
                        //   padding: const EdgeInsets.all(10),
                        //   child: TextField(
                        //     controller: NameController,
                        //     decoration: InputDecoration(
                        //         enabledBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(11),
                        //           borderSide: BorderSide(
                        //             width: 1,
                        //             color: Colors.black,
                        //           ),
                        //         ),
                        //         focusedBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(11),
                        //           borderSide:
                        //           BorderSide(width: 2, color: Colors.black),
                        //         ),
                        //         border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(11),
                        //         ),
                        //         suffixIcon: Icon(Icons.edit),
                        //         prefixIcon: Icon(
                        //           Icons.drive_file_rename_outline,
                        //           color: Colors.black,
                        //         ),
                        //         hintText: 'Daniel Ritchie',
                        //         hintStyle: TextStyle(color: Colors.grey),
                        //         labelText: 'Name',
                        //         labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                        //   ),
                        // ),
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
                                labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),


                        //Password
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: PasswordController,
                            obscureText: true,
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
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: InkWell(
                        onTap: ()async{
                          var loginEmail =  EmailController.text.toString().trim();
                          var loginpasword = PasswordController.text.toString().trim();

                          try{
                            final User? FirebaseUser =(await FirebaseAuth.instance.signInWithEmailAndPassword(
                                email:loginEmail , password:loginpasword ))

                                .user;
                            if (FirebaseUser != null){
                             AuthCheck().checkUserRoleAndNavigate(context);
                              //Navigator.push(context, MaterialPageRoute(builder: (_) => ManagerNavigationBar()));


                            }
                            else{
                              print('check email and password');
                            }
                          }on FirebaseAuthException catch(e){
                            print(e);
                          }

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) => ForgotPassword()));
                      }, child: Text('Forgot Password')),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dont have an account?"),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_) =>  SignupPage()));
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
