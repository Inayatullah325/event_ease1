import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key, required name, required address});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order ' ,style: GoogleFonts.kalam(
            fontWeight: FontWeight.bold,fontSize: 22.sp,color: Colors.white),),
        backgroundColor: Color(0XFF2f9494),
        centerTitle: true,
      ),

      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height*0.65,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFFCCF2F2),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                              'Birthday',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                              'Inayat Ullah',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                              'Porana jamuxy'
                                  ' chitral',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                              '03408285176',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                              '250',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                              '1000000',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                                'Evetnt time:',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ))
          
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(
                                'Evening:',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ))
          
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                              'Entertainment',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
          
          
          
          
          
          
          
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Center(
                //       child: Text(
                //         'Decoration',
                //         style: TextStyle(
                //             fontSize: 17, fontWeight: FontWeight.bold),
                //       )),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Center(
                //       child: Text(
                //         'cake',
                //         style: TextStyle(
                //             fontSize: 17, fontWeight: FontWeight.bold),
                //       )),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Center(
                //       child: Text(
                //         'Entertainment',
                //         style: TextStyle(
                //             fontSize: 17, fontWeight: FontWeight.bold),
                //       )),
                // ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Center(
                //       child: Text(
                //         'Photography ',
                //         style: TextStyle(
                //             fontSize: 17, fontWeight: FontWeight.bold),
                //       )),
                // ),
          
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}
