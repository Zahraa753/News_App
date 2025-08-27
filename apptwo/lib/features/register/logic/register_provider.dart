import 'package:appone/core/data/models/user_model.dart';
import 'package:appone/features/home/ui/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  void register(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;
    isLoading = true;
    notifyListeners();
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      final String uid = result.user?.uid ?? '';
      UserModel userModel = UserModel(
        uid: uid,
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        age: ageController.text,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .set(userModel.toMap());

      Fluttertoast.showToast(msg: 'Registered Successfully');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message ?? 'An error occurred');
    }
    isLoading = false;
    notifyListeners();
  }
}
