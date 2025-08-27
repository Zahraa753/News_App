import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterLogic extends ChangeNotifier {
  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;
  late Map response;

  Future<void> register(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      try {
        final response = await auth.createUserWithEmailAndPassword(
          email: emailcontroller.text.trim(),
          password: passwordcontroller.text.trim(),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✅ Registered Successfully")),
        );
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message ?? "Registration error")),
        );
      } finally {
        isLoading = false;
        notifyListeners();
      }
    }
  }

  Future<void> storeUserData() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(response.values.last)
        .set({
          "name": namecontroller.text,
          "email": emailcontroller.text,
          "phone": phonecontroller.text,
          "createdAt": FieldValue.serverTimestamp(),
        });
  }

  void printdata() {}
}
