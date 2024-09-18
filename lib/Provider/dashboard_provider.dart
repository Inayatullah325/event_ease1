import 'package:flutter/cupertino.dart';

class class_dashboard_provider with ChangeNotifier{
  List<Map<String, dynamic>> _Events =[
    {
      'image': "assets/images/Wedding.jpg",
      'name': 'Marriage',

    },
    {
      'image': "assets/images/engagement.webp",
      'name': 'Engagement',


    },
    {
      'image': "assets/images/Birthday.jfif",
      'name': 'Birthday',

    },
    {
      'image': "assets/images/anniversary2.png",
      'name': 'Anniversary',


    },
    {
      'image': "assets/images/Get-Togethers.jfif",
      'name': 'Get-Togethers',


    },
    {
      'image': "assets/images/graduation.jfif",
      'name': 'Graduation Parties',


    },
  ];
  List<Map<String, dynamic>> get Events=> _Events;
}