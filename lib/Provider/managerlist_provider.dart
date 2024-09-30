import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class favprovider extends ChangeNotifier {
  List<Map<String, dynamic>> Managers = [];
  List<Map<String, dynamic>> favorite = [];

  favprovider() {
    fetchManagers(); // Fetch managers when provider is created
  }

  Future<void> fetchManagers() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('ManagerProfile').get();
      Managers = snapshot.docs.map((doc) {
        return {
          'title': doc['name'],
          'image': doc['imageUrl'],
          'address': doc['address'],
        };
      }).toList();
      notifyListeners(); // Notify listeners to update UI
    } catch (e) {
      print('Error fetching managers: $e');
    }
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
