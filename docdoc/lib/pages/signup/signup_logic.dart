import 'package:flutter/material.dart';

class SignupLogic extends ChangeNotifier {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController confirmpasseordcontroller =
      TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController gendercontroller = TextEditingController();
}
