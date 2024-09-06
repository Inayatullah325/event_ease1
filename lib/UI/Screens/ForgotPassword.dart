import 'package:event_ease/UI/Screens/login_screen.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:kptourism/ui/login_screen/signin.dart';





class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController forgetPasswordController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
        title: const Text("Forget Password"),
        actions: const [Icon(Icons.more_vert)],
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: TextFormField(
              controller: forgetPasswordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: "E-mail",
                enabledBorder: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 15,),

          ElevatedButton(
              child: Text("Forget password"),
              onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (_) => loginpage()));
              }
          ),


        ],
      ),
    );


  }
}