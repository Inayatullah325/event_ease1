import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:event_ease/UI/Screens/Dashboard.dart';
import 'package:event_ease/UI/Screens/ProfileScreen/ManagerProfileMain.dart';
import 'package:flutter/material.dart';
import 'ExploreScreen.dart';
 import 'Orders.dart';

class ManagerNavigationBar extends StatefulWidget {
  const ManagerNavigationBar({super.key});

  @override
  State<ManagerNavigationBar> createState() => _ManagerNavigationBarState();
}

class _ManagerNavigationBarState extends State<ManagerNavigationBar> {
  int selectedvalue = 0;
  List<Widget> screens = [
    DashBoard(),
    Orders(),

    //OrderDetailScreen(documentId: 'documentId', name: "null", address: "null",),
    ExploreScreen(),
    ManagerProfileMain(),
  ];
  List<TabItem> items = [
    TabItem(
      icon: Icons.home,
      title: 'Home',
    ),
    TabItem(
      icon: Icons.list,
      title: 'Orders',
    ),
    TabItem(
      icon: Icons.explore,
      title: 'Explore',
    ),
    TabItem(
      icon: Icons.person,
      title: 'Profile',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBarInspiredInside(
        indexSelected: selectedvalue,
        onTap: (index) {
          setState(() {
            selectedvalue = index;
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
            notchSmoothness: NotchSmoothness.sharpEdge),
      ),
      body: Center(
        child: screens[selectedvalue],
      ),
    );
  }
}
