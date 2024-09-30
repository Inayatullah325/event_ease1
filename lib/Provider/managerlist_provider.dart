import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class favprovider with ChangeNotifier {
  List<Map<String, dynamic>> Managers = [];
  List<Map<String, dynamic>> favorite = [];

  favprovider() {
    fetchManagers(); // Fetch managers when provider is created
  }

  void fetchManagers() {
    FirebaseFirestore.instance.collection('User').snapshots().listen((snapshot) {
      Managers = snapshot.docs.map((doc) {
        return {
          'name': doc['name'],
          'image': doc['imageUrl'],
          'address': doc['address'],
        };
      }).toList();
      notifyListeners(); // Notify listeners to update UI
    });
  }

  void additem(Map<String, dynamic> manager) {
    favorite.add(manager);
    notifyListeners();
  }

  void removeitem(Map<String, dynamic> manager) {
    favorite.remove(manager);
    notifyListeners();
  }
}
