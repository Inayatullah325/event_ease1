import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import '../../Provider/ThemeProvider.dart';

class themescreen extends StatefulWidget {
  const themescreen({super.key});

  @override
  State<themescreen> createState() => _themescreenState();
}

class _themescreenState extends State<themescreen> {
  bool isswitch = false;
  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<Themechangeprovider>(context);
    return Scaffold(
     // backgroundColor: Color(0xFFF5FCFC),
      appBar: AppBar(
        title: Text('Themes',
          style: GoogleFonts.kalam(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: Color(0XFF2f9494),
        centerTitle: true,
      ),
      body: Column(
        children: [
          RadioListTile(
              title: Text('Light theme'),
              value:ThemeMode.light,
              groupValue:themeprovider.thememode,
              onChanged: themeprovider.changetheme),
          RadioListTile(
              title: Text('Dark them'),
              value:ThemeMode.dark,
              groupValue:themeprovider.thememode,
              onChanged: themeprovider.changetheme),
          RadioListTile(
              title: Text('System theme'),
              value:ThemeMode.system,
              groupValue:themeprovider.thememode,
              onChanged: themeprovider.changetheme),
        ],

      ),);
  }
}
