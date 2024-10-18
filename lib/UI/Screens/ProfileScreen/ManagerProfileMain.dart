import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_ease/UI/Screens/MyAlertDailogBox.dart';
import 'package:event_ease/UI/Screens/ProfileScreen/UserProfile.dart';
import 'package:event_ease/UI/Screens/ThemeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ManagerProfileMain extends StatefulWidget {
  const ManagerProfileMain({super.key});

  @override
  State<ManagerProfileMain> createState() => _ManagerProfileMainState();
}

class _ManagerProfileMainState extends State<ManagerProfileMain> {
  @override
  Widget build(BuildContext context) {
    User? userid = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manager Profile',
          style: GoogleFonts.kalam(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        backgroundColor: Color(0XFF2f9494),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('Users')
                        .doc(userid!.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      if (!snapshot.hasData || snapshot.data == null) {
                        return Center(child: Text('No managers available'));
                      }
                      var data = snapshot.data!;
                      return Wrap(
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(data['image']),
                          ),
                          ListTile(
                            title: Text(
                              data['name'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(data['email'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            trailing: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => UserProfile()));
                                },
                                child: Icon(
                                  Icons.edit,
                                  size: 30,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      );
                    },
                  )),
              // Positioned(
              //   left: 10,
              //   top: 17,
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 0.4,
              //     height: MediaQuery.of(context).size.width * 0.4,
              //     decoration: BoxDecoration(
              //         color: Colors.blueGrey,
              //         borderRadius: BorderRadius.circular(100)),
              //     child: CircleAvatar(
              //       maxRadius: 100,
              //       backgroundImage: NetworkImage(data),
              //     ),
              //   ),
              // )
            ],
          ),
          SizedBox(
            height: 9.9.h,
          ),
          Container(
            child: Expanded(
                child: ListView(
              children: [
                Card(
                  margin:
                      const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: ListTile(
                    leading: Icon(
                      Icons.privacy_tip_sharp,
                      color: Colors.black54,
                    ),
                    title: Text(
                      'Privacy',
                      style: TextStyle(
                          fontSize: .25.dp, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Card(
                  color: Colors.white,
                  margin:
                      const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: ListTile(
                    leading: Icon(Icons.help_outline, color: Colors.black54),
                    title: Text(
                      'Help & Support',
                      style: TextStyle(
                          fontSize: .25.dp, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Card(
                  color: Colors.white,
                  margin:
                      const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: ListTile(
                    leading: Icon(
                      Icons.privacy_tip_sharp,
                      color: Colors.black54,
                    ),
                    title: Text(
                      'Settings',
                      style: TextStyle(
                          fontSize: .25.dp, fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => themescreen()));
                  },
                  child: Card(
                    color: Colors.white,
                    margin:
                        const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      leading: Icon(
                        Icons.brightness_4,
                        color: Colors.black54,
                      ),
                      title: Text(
                        'Themes',
                        style: TextStyle(
                            fontSize: .25.dp, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                InkWell(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyAlertDialog()));
                  },
                  child: Card(
                    color: Colors.white,
                    margin:
                        const EdgeInsets.only(left: 35, right: 35, bottom: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Colors.black54,
                      ),
                      title: Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: .25.dp, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  ),
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}
