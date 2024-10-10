import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_ease/Provider/HomeScreen_provider.dart';
import 'package:event_ease/UI/Screens/BookingScreen.dart';
import 'package:event_ease/UI/Screens/ManagerHistory.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryOfManager extends StatefulWidget {
  String category;

  CategoryOfManager({
    super.key,
    required this.category,
  });

  @override
  State<CategoryOfManager> createState() => _CategoryOfManagerState();
}

class _CategoryOfManagerState extends State<CategoryOfManager> {
  @override
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
    Color(0xffe5e7e9)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.category,
            style: GoogleFonts.kalam(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          backgroundColor: Color(0XFF2f9494),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('Eventdata')
                          .where('eventType', isEqualTo: widget.category)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        }

                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Center(child: Text('No data available'));
                        }
                        return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            var data = snapshot.data!.docs[index];
                            return Card(
                              color: colors[index],
                              child: StreamBuilder(
                                  stream: FirebaseFirestore.instance
                                      .collection('Users')
                                      .doc(data['userid'])
                                      .snapshots(),
                                  builder: (context, sp) {
                                    if (sp.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(child: ListTile());
                                    }

                                    if (sp.hasError) {
                                      return Center(
                                          child: Text('Error: ${sp.error}'));
                                    }
                                    var userData = sp.data!.data();

                                    if (!sp.hasData || userData == null) {
                                      return const Center(
                                          child: Text('No history available'));
                                    }
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ManagerHistory(
                                              title:
                                                  sp.data!['name'].toString(),
                                              image:
                                                  sp.data!['image'].toString(),
                                              address: sp.data!['address']
                                                  .toString(),
                                              Userid: sp.data!['userId'],
                                            ),
                                          ),
                                        );
                                      },
                                      child: ListTile(
                                        subtitle: Text(data['eventType']),
                                        leading: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              sp.data!['image'] ?? ''),
                                        ),
                                        title:
                                            Text(sp.data!['name'] ?? 'unknow'),
                                      ),
                                    );
                                  }),
                            );
                          },
                        );
                      })),
            ],
          ),
        ));
  }
}
