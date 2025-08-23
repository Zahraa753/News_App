import 'package:dio/dio.dart';
import 'package:docdoc/core/local_storage/LocalStorage.dart';
import 'package:docdoc/core/networking/apiconstant.dart';
import 'package:docdoc/pages/Home/U_I/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SigninLogic extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;
  void login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final dio = Dio();
      isLoading = true;
      notifyListeners();
      try {
        final response = await dio.post(
          ApiConstants.login,
          data: {
            'email': emailController.text,
            'password': passwordController.text,
          },
        );
        Fluttertoast.showToast(msg: 'Login successful');
        final token = response.data['data']['token'];
        await LocalStorage.setString('token', token);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false,
        );
      } catch (error) {
        Fluttertoast.showToast(msg: 'The credentials are incorrect');
      }
      isLoading = false;
      notifyListeners();
    }
  }
}
