import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:io';


class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  TextEditingController NameController = TextEditingController();
  TextEditingController AddressController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();

  File? imageFile;
  String imageUrl = '';

  void _clearForm() {
    NameController.clear();
    AddressController.clear();
    PhoneController.clear();
    //PasswordController.clear();

    setState(() {});
  }

  Future<void> _bookEvent() async {
    // Get all the form values
    String name = NameController.text.trim();
    String address = AddressController.text.trim();
    String phone = PhoneController.text.trim();
   // String guests = PasswordController.text.trim();

    // Check if all the necessary fields are filled
    if (name.isEmpty || address.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please fill all required fields')));
      return;
    }
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile!.path);
      });

      String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference storageRef = FirebaseStorage.instance
          .ref()
          .child('user_image')
          .child(uniqueFileName);

      try {
        await storageRef.putFile(imageFile!);
        imageUrl = await storageRef.getDownloadURL();
        setState(() {}); // Update the state to reflect the new image
      } catch (e) {
        print('Error uploading image: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    User? userid = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Color(0xFFF5FCFC),
      appBar: AppBar(
        title: Text(
          'User Profile',
          style: GoogleFonts.kalam(
              fontWeight: FontWeight.bold,
              fontSize: 22.sp,
              color: Colors.white),
        ),
        backgroundColor: Color(0XFF2f9494),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.28,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height*0.23,
                  decoration: BoxDecoration(
                    color: Color(0XFFd1f2eb),
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(90),
                      bottomRight: Radius.circular(90),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  right: 10,
                  top: 40,
                  child: GestureDetector(
                    onTap: () {
                      pickImage();
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.21,
                      decoration: BoxDecoration(
                        image: imageFile != null
                            ? DecorationImage(
                                fit: BoxFit.cover, image: FileImage(imageFile!))
                            : DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage('assets/images/salwa1.jpeg')),
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 160,
                  right: 10,
                  left: 110,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    child: Icon(Icons.camera_alt_outlined),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                ),
              ]),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      // Name
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
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      // Address
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: AddressController,
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
                              Icons.location_on,
                              color: Colors.black,
                            ),
                            hintText: 'Anywhere North St 123',
                            hintStyle: TextStyle(color: Colors.grey),
                            labelText: 'Address',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      // Phone
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
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Save Button
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: GestureDetector(
                    onTap: () async {
                      if (NameController.text.isEmpty ||
                          AddressController.text.isEmpty ||
                          PhoneController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('Please fill all required fields')));
                        return;
                      }
                      try {
                        FirebaseFirestore.instance
                            .collection('Users')
                            .doc(userid!.uid)
                            .update({
                          'image': imageUrl,
                          'name': NameController.text,
                          'address': AddressController.text,
                          'phone': PhoneController.text,
                          'timestamp': Timestamp.now(),
                        });
                        print(" imageeeeeurlll$imageUrl");
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Update Successful')));
                        _clearForm();
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Update Failed : $e')));
                      }
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff7D7D7D),
                            spreadRadius: -1,
                            blurRadius: 7,
                            offset: Offset(0, 10),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0XFF2f9494),
                      ),
                      child: Center(
                        child: Text(
                          "Save",
                          style: GoogleFonts.kalam(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

