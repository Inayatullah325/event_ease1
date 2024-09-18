import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Provider/HomeScreen_provider.dart';

class CategoryOfManager1 extends StatefulWidget {
  final String category;
  final int index;
  final List<Map<String, List<Map<String, dynamic>>>> mylist;

  CategoryOfManager1({
    super.key,
    required this.index,
    required this.category,
    required this.mylist,
  });

  @override
  State<CategoryOfManager1> createState() => _CategoryOfManager1State();
}

class _CategoryOfManager1State extends State<CategoryOfManager1> {
  late List<Map<String, dynamic>> list;

  @override
  void initState() {
    super.initState();
    //list = widget.mylist[widget.index][widget.category]!;
    if (widget.index >= 0 && widget.index < widget.mylist.length) {
      list = widget.mylist[widget.index][widget.category] ?? [];
    } else {
      list = [];
    }
  }

  @override
  Widget build(BuildContext context) {
    final Event_categoroy = Provider.of<event_categoroy>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Managers',
          style: GoogleFonts.kalam(
              fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color(0XFF2f9494),
        centerTitle: true,
      ),
      body: Event_categoroy.AllCategoryManager.isEmpty
          ? Center(
        child: Text(
          "No managers available for this category.",
          style: GoogleFonts.kalam(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )
          : ListView.builder(
        itemCount: Event_categoroy.AllCategoryManager.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
             backgroundImage: AssetImage(Event_categoroy.AllCategoryManager[index]['image'].toString()),),


            title: Text(Event_categoroy.AllCategoryManager[index]['title'].toString()),
            subtitle: Text(Event_categoroy.AllCategoryManager[index]['address'].toString()),
          );
        },
      ),
    );
  }
}
