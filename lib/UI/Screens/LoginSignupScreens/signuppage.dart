import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String selectedRole = 'user';  // Default role set to 'user'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [Color(0XFF2f9494), Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/eventbg.png'),
                _buildTextField(
                  controller: nameController,
                  icon: Icons.drive_file_rename_outline,
                  hintText: 'Daniel Ritchie',
                  labelText: 'Name',
                ),
                _buildTextField(
                  controller: emailController,
                  icon: Icons.email,
                  hintText: 'abc123@gmail.com',
                  labelText: 'Email',
                ),
                _buildTextField(
                  controller: phoneController,
                  icon: Icons.phone_android,
                  hintText: '0321-1234567',
                  labelText: 'Contact Number',
                  isNumber: true,
                ),
                _buildTextField(
                  controller: passwordController,
                  icon: Icons.remove_red_eye_rounded,
                  hintText: 'Password@123',
                  labelText: 'Password',
                  isObscure: true,
                ),

                // Role selection dropdown
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    value: selectedRole,
                    items: <String>['user', 'manager'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedRole = newValue!;
                      });
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(width: 1, color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: const BorderSide(width: 2, color: Colors.black),
                      ),
                      hintText: 'Role',
                      labelText: 'Role',
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Signup Button
                GestureDetector(
                  onTap: () async {
                    await _signupUser();
                  },
                  child: Container(
                    width: 200,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0XFF2f9494),
                    ),
                    child: const Center(
                      child: Text(
                        "Signup",
                        style: TextStyle(
                          fontFamily: "Bebas",
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required String hintText,
    required String labelText,
    bool isObscure = false,
    bool isNumber = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: const BorderSide(width: 1, color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11),
            borderSide: const BorderSide(width: 2, color: Colors.black),
          ),
          suffixIcon: const Icon(Icons.edit),
          prefixIcon: Icon(icon, color: Colors.black),
          hintText: hintText,
          labelText: labelText,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Future<void> _signupUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      User? currentUser = userCredential.user;

      // Store user details in Firestore based on role
      if (currentUser != null) {
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(currentUser.uid)
            .set({
          'phone': phoneController.text.trim(),
          'role': selectedRole,
          'userId': currentUser.uid,
          'email': emailController.text.trim(),
          'name': nameController.text.trim(),
          'image': '',
          'address': '',
          'createdAt': DateTime.now(),


        });

        // Navigate to login after successful signup
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  loginpage()),
        );
      }
    } catch (e) {
      print("Error during signup: $e");
    }
  }
}
