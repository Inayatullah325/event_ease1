import 'package:event_ease/Provider/managerlist_provider.dart';
import 'package:event_ease/UI/Screens/ManagerHistory.dart';
import 'package:event_ease/UI/Screens/Manager_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class managerdetails extends StatefulWidget {
  const managerdetails({super.key});

  @override
  State<managerdetails> createState() => _managerdetailsState();
}

class _managerdetailsState extends State<managerdetails> {
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
  Widget build(BuildContext context) {
    final obj = Provider.of<favprovider>(context);
    final obj_favprovider = Provider.of<favprovider>(context);

    List<Map<dynamic, dynamic>> filteredManagers = obj.Managers.where((manager) {
      return manager['title'].toLowerCase().contains(searchQuery.toLowerCase()) ||
          manager['address'].toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
        backgroundColor: Color(0xFFF5FCFC),
        appBar: AppBar(
          title: Text(
            'Manager List',
            style: GoogleFonts.kalam(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
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
                    itemCount: obj.Managers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: colors[index],
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ManagerHistory(
                                          title: obj.Managers[index]['title']
                                              .toString(),
                                          image: obj.Managers[index]['image']
                                              .toString(),
                                          address: obj.Managers[index]
                                              ['address'],
                                        )));
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                                backgroundImage:
                                    AssetImage(obj.Managers[index]['image'])),
                            title: Text(obj.Managers[index]['title']),
                            subtitle: Text(obj.Managers[index]['address']),
                            trailing: InkWell(
                              onTap: () {
                                obj_favprovider.favorite.contains(index)
                                    ? obj_favprovider.removeitem(index)
                                    : obj_favprovider.additem(index);
                              },
                              child: obj_favprovider.favorite.contains(index)
                                  ? Icon(Icons.favorite)
                                  : Icon(
                                      Icons.favorite_border_outlined,
                                    ),
                            ),
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
