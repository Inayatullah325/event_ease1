import 'package:event_ease/Provider/dashboard_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Provider/HomeScreen_provider.dart';

import 'CategoryOfManagers.dart';
import 'LoginSignupScreens/login_screen.dart';
import 'Manager_details.dart';
import 'PracticeClass.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    final instance_homescreen=Provider.of<event_categoroy>(context);
    final instance_dashboard=Provider.of<class_dashboard_provider>(context);

    return Scaffold(

      //backgroundColor: Color(0xFFF5FCFC),

      appBar: AppBar(
        title: Text('Event Ease ' ,style: GoogleFonts.kalam(
            fontWeight: FontWeight.bold,fontSize: 22.sp,color: Colors.white),),
        backgroundColor: Color(0XFF2f9494),
        centerTitle: true,


      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Event Types...",style: GoogleFonts.kalam(
              fontWeight: FontWeight.bold,fontSize: 25,) ),
          ),
          Divider(
            thickness: 2,
            color: Colors.black,
          ),
           Expanded(
             child: GridView.builder(
              itemCount: instance_dashboard.Events.length,
              gridDelegate : SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2/2,
              ),
              itemBuilder: (context,  index){

                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => CategoryOfManager(
                      category: instance_dashboard.Events[index]['name'],
                     


                    )));
                  },
                  child: Container(
                   height: MediaQuery.of(context).size.height*0.3,
                    width: MediaQuery.of(context).size.width*0.2,
                    decoration: BoxDecoration(
                      color: Color(0xffe5e7e9),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height*0.16,

                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(instance_dashboard.Events[index]['image']),
                                  fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20),
                            ),

                          ),

                          Text(instance_dashboard.Events[index]['name'], style: GoogleFonts.kalam(fontSize: 18,
                              fontWeight: FontWeight.bold),),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Center(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height*0.029,
                                    width: MediaQuery.of(context).size.width*0.46,


                                    decoration: BoxDecoration(
                                        color: Color(0XFF2f9494),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(3),
                                          topRight: Radius.circular(3),
                                          bottomRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                        )
                                    ),
                                    child: Center(child: Text('See Managers',style: GoogleFonts.kalam
                                      (fontSize: 15,fontWeight: FontWeight.bold ,color: Colors.white),)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
             ),
           ),
        ],
      ),



    );
  }
}
