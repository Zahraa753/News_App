import 'package:appone/core/data/app_data.dart';
import 'package:appone/features/home/logic/home_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class UpdateProfileProvider extends ChangeNotifier {
  final ageController = TextEditingController(text: user?.age);
  final nameController = TextEditingController(text: user?.name);
  final phoneController = TextEditingController(text: user?.phone);
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  void updateProfile(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    isLoading = true;
    notifyListeners();
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .update({
            'name': nameController.text,
            'age': ageController.text,
            'phone': phoneController.text,
          });
      await context.read<HomeProvider>().getUser();
      isLoading = false;
      notifyListeners();
      Fluttertoast.showToast(msg: 'Profile updated successfully');
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(msg: e.message ?? 'Unknown error');
    }
    isLoading = false;
    notifyListeners();
  }
}
