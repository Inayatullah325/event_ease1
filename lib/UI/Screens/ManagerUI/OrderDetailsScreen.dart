import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({
    super.key,
    required this.eventtype,
    required this.name,
    required this.address,
    required this.phoneno,
    required this.guest,
    required this.budget,
    required this.eventtime,
    required this.services,
  });
  final String eventtype,
      name,
      address,
      phoneno,
      guest,
      budget,
      eventtime,
      services;

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order details',
          style: GoogleFonts.kalam(
              fontWeight: FontWeight.bold,
              fontSize: 22.sp,
              color: Colors.white),
        ),
        backgroundColor: Color(0XFF2f9494),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.65,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xFFCCF2F2),
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          'Event types:',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          widget.eventtype,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.normal),
                        )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          'Name:',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          widget.name,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.normal),
                        )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          'Address:',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          widget.address,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.normal),
                        )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          'Phone number:',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          widget.phoneno,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.normal),
                        )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          'Number of gust:',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          widget.guest,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.normal),
                        )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          'Budget:',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          widget.budget,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.normal),
                        )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                            'Evetnt time:',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ))),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                            widget.eventtime.toString(),
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.normal),
                          ))),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          'select services:',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        )),
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                            widget.services,
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.normal),
                          )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
