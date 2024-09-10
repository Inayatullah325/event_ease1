import 'package:event_ease/Provider/managerlist_provider.dart';
import 'package:event_ease/UI/Screens/ManagerHistory.dart';
import 'package:event_ease/UI/Screens/Manager_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class managerdetails extends StatefulWidget {
  String  category;
  int index;
  List<Map<String, List<Map<String, dynamic>>>> mylist;




    managerdetails({super.key,
      required this.index,
  required this.category,
      required this.mylist,
    });

  @override
  State<managerdetails> createState() => _managerdetailsState();
}

class _managerdetailsState extends State<managerdetails> {
  late List<Map<String,dynamic>> list;




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

  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = widget.AllCategoryManager[widget.index][widget.title]!;
  }



  @override
  Widget build(BuildContext context) {
    final obj_favprovider = Provider.of<favprovider>(context);

    List<Map<dynamic, dynamic>> filteredManagers = obj_favprovider.Managers.where((manager) {
      return manager['title'].toLowerCase().contains(searchQuery.toLowerCase()) ||
          manager['address'].toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
        backgroundColor: Color(0xFFF5FCFC),
        appBar: AppBar(
          title: Text(
            'Manager List',
            style: GoogleFonts.kalam(
                fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Color(0XFF2f9494),
          centerTitle: true,
        ),
        body: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => ManagerProfile()));
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search Managers',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                ),
              ),

              Expanded(
                child: ListView.builder(
                    itemCount: obj_favprovider.Managers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: colors[index],
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ManagerHistory(
                                          title: obj_favprovider.Managers[index]['title']
                                              .toString(),
                                          image: obj_favprovider.Managers[index]['image']
                                              .toString(),
                                          address: obj_favprovider.Managers[index]
                                              ['address'],
                                        )));
                          },
                          child: Consumer<favprovider>(builder: (context, vm, child) {
                            return ListTile(
                              leading: CircleAvatar(
                                  backgroundImage:
                                  AssetImage(obj_favprovider.Managers[index]['image'].toString())),
                              title: Text(obj_favprovider.Managers[index]['title']),
                              subtitle: Text(obj_favprovider.Managers[index]['address']),
                              trailing: InkWell(
                                onTap: () {
                                  vm.favorite.contains(obj_favprovider.Managers[index])
                                      ? vm.removeitem(obj_favprovider.Managers[index])
                                      : obj_favprovider.additem(obj_favprovider.Managers[index]);
                                },
                                child: vm.favorite.contains(obj_favprovider.Managers[index])
                                    ? Icon(Icons.favorite,color: Colors.red,)
                                    : Icon(
                                  Icons.favorite_border_outlined,
                                ),
                              ),
                            );
                          },

                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
