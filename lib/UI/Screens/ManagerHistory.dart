// import 'package:event_ease/UI/Screens/BookingScreen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ManagerHistory extends StatelessWidget {
//   final String image;
//   final String title;
//   final String address;

//   ManagerHistory({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.address,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Manager History',
//           style: GoogleFonts.kalam(
//             fontSize: 22.sp,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         backgroundColor: Color(0XFF2f9494),
//         centerTitle: true,
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CircleAvatar(
//                   maxRadius: 100,
//                   backgroundImage: NetworkImage(
//                     image.isNotEmpty
//                         ? image
//                         : 'https://via.placeholder.com/150', // Placeholder image
//                   ),
//                 ),
//                 SizedBox(height: 16), // Spacing between CircleAvatar and Text
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 19.sp,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 15), // Spacing between Title and Address
//                 Text(
//                   address,
//                   style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: StreamBuilder<DocumentSnapshot>(
//                     stream: FirebaseFirestore.instance
//                         .collection('Eventdata') // Replace with your collection name
//                         .doc('yourDocumentId') // Replace with the document ID
//                         .snapshots(),
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return CircularProgressIndicator();
//                       }

//                       if (snapshot.hasError) {
//                         return Text('Error: ${snapshot.error}');
//                       }

//                       if (!snapshot.hasData || !snapshot.data!.exists) {
//                         return Text('No data available');
//                       }

//                       // Assuming your Explore document contains the relevant fields
//                       var exploreData = snapshot.data!.data() as Map<String, dynamic>;

//                       String eventType = exploreData['eventType'] ?? 'Unknown';
//                       int numberOfMembers = exploreData['numberOfMembers'] ?? 0;
//                       int availableSpace = exploreData['availableSpace'] ?? 0;
//                       int budget = exploreData['budget'] ?? 0;
//                       String description = exploreData['description'] ?? 'No description';

//                       return Container(
//                         height: MediaQuery.of(context).size.height * 0.95,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: Color(0xFFCCF2F2),
//                           borderRadius: BorderRadius.circular(5.h),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               height: MediaQuery.of(context).size.height * 0.3,
//                               width: double.infinity,
//                               decoration: BoxDecoration(
//                                 color: Colors.red,
//                                 borderRadius: BorderRadius.circular(5.h),
//                                 image: DecorationImage(
//                                   fit: BoxFit.cover,
//                                   image: AssetImage('assets/images/couplepic.jpg'),
//                                 ),
//                               ),
//                             ),
//                             buildInfoRow('Event type:', eventType),
//                             buildInfoRow('Number of members:', numberOfMembers.toString()),
//                             buildInfoRow('Available space:', availableSpace.toString()),
//                             buildInfoRow('Your budget:', budget.toString()),
//                             buildDescription(description),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Center(
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => BookingScreen(),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         height: MediaQuery.of(context).size.height * 0.09,
//                         width: MediaQuery.of(context).size.width * 0.6,
//                         decoration: BoxDecoration(
//                           color: const Color(0XFF2f9494),
//                           borderRadius: BorderRadius.circular(10.h),
//                         ),
//                         child: Center(
//                           child: Text(
//                             'Use Service',
//                             style: GoogleFonts.kalam(
//                               fontSize: 22.sp,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildInfoRow(String label, String value) {
//     return Row(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Center(
//             child: Text(
//               label,
//               style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Center(
//             child: Text(
//               value,
//               style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget buildDescription(String description) {
//     return Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Center(
//         child: Text(
//           description,
//           style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_ease/UI/Screens/BookingScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ManagerHistory extends StatelessWidget {
  final String image;
  final String title;
  final String address, Userid;

  ManagerHistory({
    super.key,
    required this.image,
    required this.title,
    required this.address,
    required this.Userid,
  });

  @override
  Widget build(BuildContext context) {
    User? userid = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manager History',
          style: GoogleFonts.kalam(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0XFF2f9494),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('Eventdata')
                      .where('userid', isEqualTo: Userid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No history available'));
                    }
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            maxRadius: 100,
                            backgroundImage: NetworkImage(
                              image.isNotEmpty
                                  ? image
                                  : 'https://via.placeholder.com/150', // Placeholder image
                            ),
                          ),
                          SizedBox(
                              height:
                                  16), // Spacing between CircleAvatar and Text
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 19.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                              height: 15), // Spacing between Title and Address
                          Text(
                            address,
                            style: TextStyle(
                                fontSize: 17.sp, fontWeight: FontWeight.bold),
                          ),
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.docs.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var data = snapshot.data!.docs[index];
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.95,
                                    width: double.infinity,
                                    //MediaQuery.of(context).size.width * 0.95,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFCCF2F2),
                                      borderRadius: BorderRadius.circular(5.h),
                                    ),

                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          width: double.infinity,
                                          //MediaQuery.of(context).size.width * 0.9,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(5.h),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image:
                                                  NetworkImage(data['image']),
                                            ),
                                            // child: Image.
                                            //Image.asset("assets/images/couplepic.jpg"),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                  child: Text(
                                                'Event type:',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                  child: Text(
                                                data['eventType'],
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                  child: Text(
                                                'Number of members:',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                  child: Text(
                                                data['members'],
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                  child: Text(
                                                'Available space:',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                  child: Text(
                                                data['space'],
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                  child: Text(
                                                'Your budget:',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                  child: Text(
                                                data['budget'],
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ),
                                          ],
                                        ),
                                        Center(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Center(
                                                  child: Text(
                                                    'Description:',
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Center(
                                            child: Text(
                                              data['description'],
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => BookingScreen(
                                        Userid: snapshot.data!.docs[0]
                                            ['userid']),
                                  ),
                                );
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.09,
                                width: MediaQuery.of(context).size.width * 0.6,
                                decoration: BoxDecoration(
                                  color: const Color(0XFF2f9494),
                                  borderRadius: BorderRadius.circular(10.h),
                                ),
                                child: Center(
                                  child: Text(
                                    'Use Service',
                                    style: GoogleFonts.kalam(
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                          ),
                        ]);
                  })),
        ),
      ),
    );
  }
}
