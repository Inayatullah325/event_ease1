import 'package:event_ease/UI/Screens/BookingScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ManagerHistory extends StatelessWidget {
  final String image;
  final String title;
  final String address;

  ManagerHistory({
    super.key,
    required this.image,
    required this.title,
    required this.address,
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
            child: Column(
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
                  SizedBox(height: 16), // Spacing between CircleAvatar and Text
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15), // Spacing between Title and Address
                  Text(
                    address,
                    style:
                    TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.95,
                          width: double.infinity,
                          //MediaQuery.of(context).size.width * 0.95,
                          decoration: BoxDecoration(
                            color: Color(0xFFCCF2F2),

                            borderRadius: BorderRadius.circular(5.h),
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.3,
                                width: double.infinity,
                                //MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5.h),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                    AssetImage('assets/images/couplepic.jpg'),
                                  ),
                                  // child: Image.
                                  //Image.asset("assets/images/couplepic.jpg"),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                          'Event type:',
                                          style: TextStyle(
                                              fontSize: 17, fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                          'Marraige',
                                          style: TextStyle(
                                              fontSize: 17, fontWeight: FontWeight.bold),
                                        )),
                                  ),

                                ],
                              ),

                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                          'Number of members:',
                                          style: TextStyle(
                                              fontSize: 17, fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                          '25',
                                          style: TextStyle(
                                              fontSize: 17, fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                          'Available space:',
                                          style: TextStyle(
                                              fontSize: 17, fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                          '250',
                                          style: TextStyle(
                                              fontSize: 17, fontWeight: FontWeight.bold),
                                        )),
                                  ),

                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                          'Your budget:',
                                          style: TextStyle(
                                              fontSize: 17, fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                          '1000000',
                                          style: TextStyle(
                                              fontSize: 17, fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ],
                              ),
                              Center(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Center(
                                        child: Text(
                                          'Description:',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
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
                                    'I recently had the pleasure of managing my friends engagement, '
                                        'and it was a truly magical experience! From coordinating the event to'
                                        ' designing every detail, I ensured that the day was perfectly tailored '
                                        'to their vision. The celebration was a beautiful blend of joy, love, and '
                                        'unforgettable moments for everyone involved!',
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),


                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BookingScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.09,
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
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
