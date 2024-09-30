import 'package:event_ease/Provider/HomeScreen_provider.dart';
import 'package:event_ease/UI/Screens/BookingScreen.dart';
import 'package:event_ease/UI/Screens/ManagerHistory.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoryOfManager extends StatefulWidget {
  String category;
  int index;
  List<Map<String, List<Map<String, dynamic>>>> mylist;

  CategoryOfManager({
    super.key,
    required this.index,
    required this.category,
    required this.mylist,
  });

  @override
  State<CategoryOfManager> createState() => _CategoryOfManagerState();
}

class _CategoryOfManagerState extends State<CategoryOfManager> {
  late List<Map<String, dynamic>> list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //list = widget.mylist[widget.index][widget.category]!;
    if (widget.index >= 0 && widget.index < widget.mylist.length) {
      list = widget.mylist[widget.index][widget.category] ?? [];
    } else {
      list = [];
    }
  }

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
                  child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: colors[index],
                    child:  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>
                            ManagerHistory(
                                image:  list[index]['image'].toString(),
                                title:  list[index]['title'].toString() ,
                                address:  list[index]['address'].toString()
                         ,),));
                      },
                      child: ListTile(
                        subtitle: Text(list[index]['address']),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(list[index]['image']),
                        ),
                        title: Text(list[index]['title']),
                      ),
                    ),
                  );
                },
              )),
            ],
          ),
        ));
  }
}
