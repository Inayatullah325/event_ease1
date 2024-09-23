import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Themechangeprovider with  ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get thememode => _themeMode;

  void changetheme (thememode){
    _themeMode =thememode;
    notifyListeners();

  }
}