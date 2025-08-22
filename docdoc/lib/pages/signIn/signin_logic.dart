import 'package:flutter/material.dart';

class SigninLogic extends ChangeNotifier {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();
  signin() {}
}
