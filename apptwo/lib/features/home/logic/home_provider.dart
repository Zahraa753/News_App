import 'package:appone/core/data/app_data.dart';
import 'package:appone/core/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  Future<void> getUser() async {
    final userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    final result = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get();

    final data = result.data();
    if (data != null) user = UserModel.fromMap(data);
    notifyListeners();
  }

  final searchController = TextEditingController();

  void searchForUser() {
    users = users
        .where(
          (element) => element.name.toLowerCase().contains(
            searchController.text.toLowerCase(),
          ),
        )
        .toList();

    notifyListeners();
  }

  List<UserModel> users = [];
  bool isLoading = false;
  void getAllUsers() async {
    users.clear();
    isLoading = true;
    notifyListeners();
    final result = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    for (var doc in result.docs) {
      final userModel = UserModel.fromMap(doc.data());
      users.add(userModel);
    }
    isLoading = false;
    notifyListeners();
  }
}
