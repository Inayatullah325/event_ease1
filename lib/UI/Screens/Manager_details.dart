import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_ease/Provider/managerlist_provider.dart';
import 'package:event_ease/UI/Screens/ManagerHistory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ManagerDetails extends StatefulWidget {
  ManagerDetails({super.key});

  @override
  State<ManagerDetails> createState() => _ManagerDetailsState();
}

class _ManagerDetailsState extends State<ManagerDetails> {
  late List<Map<String, dynamic>> list;
  List<Color> colors = [
    Color(0xffe5e7e9),
    Color(0xffe5e7e9),
    Color(0xffe5e7e9),
    Color(0xffe5e7e9),
    Color(0xffe5e7e9),
    Color(0xffe5e7e9),
    Color(0xffe5e7e9),
    Color(0xffe5e7e9),
    Color(0xffe5e7e9),
    Color(0xffe5e7e9),
  ];

  @override
  Widget build(BuildContext context) {
    final obj_favprovider = Provider.of<favprovider>(context);
    User? userid = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: Color(0xFFF5FCFC),
      appBar: AppBar(
        title: Text(
          'Manager List',
          style: GoogleFonts.kalam(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0XFF2f9494),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .where('role', isEqualTo: "manager")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No managers available'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              var data = snapshot.data!.docs[index];

              return Card(
                color: colors[index % colors.length],
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ManagerHistory(
                          title: data['name'].toString(),
                          image: data['image'].toString(),
                          address: data['address'].toString(),
                          Userid: data['userId'],
                         
                        ),
                      ),
                    );
                  },
                  child: Consumer<favprovider>(
                    builder: (context, vm, child) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            data['image'] != null
                                ? data['image']
                                : 'https://via.placeholder.com/150',
                          ),
                        ),
                        title: Text(data['name'] ?? 'No Name'),
                        subtitle: Text(data['address'] ?? 'No Address'),
                        trailing: InkWell(
                          onTap: () {
                            if (vm.favorite.contains(data.id)) {
                            } else {}
                          },
                          child: Icon(
                            vm.favorite.contains(data.id)
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: vm.favorite.contains(data.id)
                                ? Colors.red
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
