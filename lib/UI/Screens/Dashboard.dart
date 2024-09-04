import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Manager_details.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> Events =[
      {
        'image': "assets/images/Wedding.jpg",
        'name': 'Marriage',

      },
      {
        'image': "assets/images/engagement.webp",
        'name': 'Engagement',


      },
      {
        'image': "assets/images/Birthday.jfif",
        'name': 'Birthday',

      },
      {
        'image': "assets/images/anniversary2.png",
        'name': 'Anniversary',


      },
      {
        'image': "assets/images/Get-Togethers.jfif",
        'name': 'Get-Togethers',


      },
      {
        'image': "assets/images/graduation.jfif",
        'name': 'Graduation Parties',


      },
    ];

    return Scaffold(

      backgroundColor: Color(0xFFF5FCFC),

      appBar: AppBar(
        title: Text('Event Ease ' ,style: GoogleFonts.kalam(
            fontWeight: FontWeight.bold,fontSize: 35,color: Colors.white),),
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
           Expanded(
             child: InkWell(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => managerdetails()));
               },

               child: GridView.builder(
                itemCount: Events.length,
                gridDelegate : SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2/2,
                ),
                itemBuilder: (context, int index){

                  return Container(
                    height: 200,
                    width: 200,
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
                            height: 123,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(Events[index]['image']),
                                  fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20),
                            ),

                          ),
                         // Image.asset(Events[index]['image'],height: 120,width: 210,),
                          Text(Events[index]['name'], style: GoogleFonts.kalam(fontSize: 18,
                              fontWeight: FontWeight.bold),),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: Center(
                                  child: Container(
                                    height: 20,
                                    width: 169,
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
                  );
                },
               ),
             ),
           ),
        ],
      ),



    );
  }
}
