import 'package:event_ease/UI/Screens/LoginSignupScreens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../ThemeScreen.dart';
import 'Manager_profile.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String? _selectedTheme = 'Light';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: Color(0xFFF5FCFC),
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: GoogleFonts.kalam(
            fontWeight: FontWeight.bold,
            fontSize: 22.sp,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0XFF2f9494),
        centerTitle: true,
        actions: [
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: PopupMenuButton(
          //     icon: Icon(Icons.more_vert_outlined,size: 3.5.h,color: Colors.white,),
          //     itemBuilder: (context) => [
          //       const PopupMenuItem(
          //         child: Text('Themes'),
          //       ),
          //       const PopupMenuItem(
          //         child: Text('LogOut'),
          //       ),
          //       const PopupMenuItem(
          //         child: Text('settings'),
          //       ),
          //       const PopupMenuItem(
          //         child: Text('about'),
          //       ),
          //       const PopupMenuItem(
          //         child: Text('privacy'),
          //
          //       ),
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: PopupMenuButton<String>(
              icon: Icon(
                Icons.more_vert,
                size: 3.5.h,
                color: Colors.white,
              ),
              onSelected: (value) {

                if (value == 'light and dark') {

                } else if (value == 'Logout') {

                } else if (value == 'setting') {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => UserProfile()));
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'light and dark',
                    child: ListTile(
                      leading: Icon(Icons.brightness_6, color: Colors.black),
                      title: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_) => themescreen()));
                          },
                          child: Text('Light and Dark')),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'Logout',
                    child: ListTile(
                      leading: Icon(Icons.logout, color: Colors.black),
                      title: InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_) => loginpage()));
                          },
                          child: Text('Logout')),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'setting',
                    child: ListTile(
                      leading: Icon(Icons.settings, color: Colors.black),
                      title: Text('Settings'),
                    ),

                  ),
                ];
              },

            ),
          )
        ],
      ),


      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.28,
                  ),
                  Container(
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
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.21,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage('assets/images/KHAN.jpeg'),
                        ),
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black),
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
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    // Name field
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
                            borderSide: BorderSide(width: 2, color: Colors.black),
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
                    // Contact number
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
                            borderSide: BorderSide(width: 2, color: Colors.green),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.h),
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
                            borderSide: BorderSide(width: 2, color: Colors.black),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                            borderSide: BorderSide(width: 2, color: Colors.black),
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
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ManagerProfile()));
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
