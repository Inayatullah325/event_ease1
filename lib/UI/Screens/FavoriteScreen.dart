import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Provider/managerlist_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteprovider = Provider.of<favprovider>(context, listen: false);
    return Scaffold(
      //backgroundColor: Color(0xFFF5FCFC),

      appBar: AppBar(
        title: Text(
          "Favorite Screen",
          style: GoogleFonts.kalam(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color(0XFF2f9494),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Consumer<favprovider>(builder: (context, vm, child) {
            return Expanded(
              child: ListView.builder(
                itemCount: vm.favorite.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(vm.favorite[index]['title']),
                    subtitle: Text(vm.favorite[index]['address']),
                    leading: CircleAvatar(backgroundImage: AssetImage(vm.favorite[index]['image']),),
                    trailing: InkWell(onTap: (){
                      favoriteprovider.removeitem(vm.favorite[index]);
                    },child: Icon(Icons.favorite)),
                  );
                },
              ),
            );
          },
          )
        ],
      ),
    );
  }
}
