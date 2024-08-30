import 'package:event_ease/Provider/managerlist_provider.dart';
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

  List <Color> colors=[Color(0xffe5e7e9),Color(0xffe5e7e9),Color(0xffe5e7e9),Color(0xffe5e7e9),
    Color(0xffe5e7e9),Color(0xffe5e7e9),Color(0xffe5e7e9),Color(0xffe5e7e9),Color(0xffe5e7e9),Color(0xffe5e7e9)];

  List<String> _filteredEvents = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredEvents = _filteredEvents;
    _searchController.addListener(_filterItems);
  }

  void _filterItems() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredEvents = _filteredEvents.where((item) {
        return item.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
  final obj=Provider.of<favprovider>(context);
    final obj_favprovider  =Provider.of<favprovider>(context);

    return Scaffold(
      //backgroundColor: Color(0XFF2f9494),
        appBar: AppBar(
          title: Text('Manager List',style: GoogleFonts.kalam
            (fontSize: 35,fontWeight: FontWeight.bold, color: Colors.white),),
          backgroundColor: Color(0XFF2f9494),
          centerTitle: true,
        ),
        body:GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => ManagerProfile()));
          },
          child: Column(
            children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 20, 8),

              child:
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search by Name...',
                      prefixIcon: Icon(Icons.search),
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  )
            ),

              Expanded(
                child: ListView.builder(
                    itemCount: obj.Managers.length,
                    itemBuilder: (BuildContext context, int index){
                      return Card(
                        color: colors[index],

                        child: ListTile(
                          leading: CircleAvatar(backgroundImage: AssetImage(obj.Managers[index]['image'])),
                          title: Text(obj.Managers[index]['title']),
                          subtitle: Text(obj.Managers[index]['address']),
                          trailing: InkWell(
                            onTap: (){
                              obj_favprovider.favorite.contains(index)?
                              obj_favprovider.removeitem(index) : obj_favprovider.additem(index);

                            },
                            child: obj_favprovider.favorite.contains(index)?Icon(Icons.favorite)
                                :Icon(Icons.favorite_border_outlined,),
                          ),
                        ),

                      );
                    }
                ),
              )
            ],
          ),
        )
    );
  }
}
