import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:event_ease/UI/Screens/Dashboard.dart';
import 'package:flutter/material.dart';

import 'FavoriteScreen.dart';
import 'Manager_details.dart';
import 'ProfileScreen/UserProfileMain.dart';


class navigationbuttombarr extends StatefulWidget {
  const navigationbuttombarr({super.key});

  @override
  State<navigationbuttombarr> createState() => _navigationbuttombarrState();
}

class _navigationbuttombarrState extends State<navigationbuttombarr> {
  
  int selectedvalue = 0;
  List<Widget> screens=[

    DashBoard(),
    ManagerDetails(),
    FavoriteScreen (),
    UserProfileMain ()
    
    
  ];
  List<TabItem> items=[
    TabItem (
      icon: Icons.home,
      title: 'Home',

    ),
    TabItem (
      icon: Icons.manage_accounts,
      title: 'All Manager',

    ),
    TabItem (
      icon: Icons.favorite,
      title: 'favorite',

    ),
    TabItem (
      icon: Icons.person,
      title: 'Profile',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:BottomBarInspiredInside(
        indexSelected: selectedvalue,
        onTap: (index){
          setState(() {
            selectedvalue=index;
          });
        },
          items: items,
        backgroundColor: Color(0XFF2f9494),
        color: Colors.white,
        colorSelected: Colors.white,
        itemStyle: ItemStyle.circle,
        animated: true,
        isAnimated: true,

        chipStyle: ChipStyle(
          background: Color(0XFF2f9494),
          notchSmoothness: NotchSmoothness.sharpEdge
        ),
      ),
      body: Center(
        child: screens[selectedvalue],
      ),
      
    );
  }
}
