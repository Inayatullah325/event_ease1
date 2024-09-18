import 'package:flutter/cupertino.dart';

class favprovider with ChangeNotifier{
  List<Map<String,dynamic>> _Managers =[
    {
      'image': "assets/images/salwa.jpeg",
      'title': 'Aabid Khan',
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
  List<Map<String,dynamic>> get Managers=> _Managers;

  List<Map<String,dynamic>> _favorite = [];
  List<Map<String,dynamic>> get favorite => _favorite;

 void additem (Map<String,dynamic> item){
   _favorite.add(item);
   notifyListeners();
 }
  void removeitem (Map<String,dynamic> item){
    _favorite.remove(item);
    notifyListeners();
  }
 }
