import 'package:flutter/cupertino.dart';

class favprovider with ChangeNotifier{
  List<Map<dynamic,dynamic>> _Managers =[
    {
      'image': "assets/images/salwa.jpeg",
      'title': 'Inayat Ullah',
      'address': 'Board Bazar peshawer '
    },
    {
      'image': "assets/images/salwa.jpeg",
      'title': 'Malak Roman ',
      'address': ' Charsada chok mardan'
    },
    {
      'image': "assets/images/salwa.jpeg",
      'title': 'Asfan Wadood',
      'address': 'Temargara Dir Lower',

    },

    {
      'image': "assets/images/salwa.jpeg",
      'title': 'Basharat Aziz',
      'address': ' Khas Dir Upper'
    },
    {
      'image': "assets/images/salwa.jpeg",
      'title': 'Asif Jalal',
      'address': 'Swat Matta'
    },
    {
      'image': "assets/images/salwa.jpeg",
      'title': 'Aftab Ahmad',
      'address': 'Swabi Shawy Ada'
    },
    {
      'image': "assets/images/salwa.jpeg",
      'title': 'Muhammad Rafiq ',
      'address': 'Mengora Swat'
    },
    {
      'image': "assets/images/salwa.jpeg",
      'title': 'Khalid',
      'address': 'Samarbagh Dir Lower'
    },
    {

      'image': "assets/images/salwa.jpeg",
      'title': 'Sajjad Ahmad',
      'address': 'Denin Chitral'
    },
    {

      'image': "assets/images/salwa.jpeg",
      'title': 'mansoor Ali',
      'address': 'Town Chitral'
    },


  ];
  List<Map<dynamic,dynamic>> get Managers=> _Managers;

List<dynamic> _favorite = [];
List<dynamic> get favorite => _favorite;

 void additem (int value){
   _favorite.add(value);

   notifyListeners();
 }
 void removeitem (int value){
   _favorite.remove(value);

  notifyListeners();
 }
}