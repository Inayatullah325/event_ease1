import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManagerHistory extends StatefulWidget {
  String title;
  String image;
  String address;

  ManagerHistory(
      {super.key,
      required this.title,
      required this.image,
      required this.address});

  @override
  State<ManagerHistory> createState() => _ManagerHistoryState();
}

class _ManagerHistoryState extends State<ManagerHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manager History',style: GoogleFonts.kalam(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
        backgroundColor: Color(0XFF2f9494),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.title),
              Text(widget.image),
              Text(widget.address),

            ],
          ),
        ),
      ),
    );
  }
}
