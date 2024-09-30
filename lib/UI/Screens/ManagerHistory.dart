import 'package:event_ease/UI/Screens/BookingScreen.dart';
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
        backgroundColor: const Color(0XFF2f9494),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
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
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8), // Spacing between Title and Address
              Text(
                address,
                style: TextStyle(
                  fontSize: 15.sp,
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
            ],
          ),
        ),
      ),
    );
  }
}
