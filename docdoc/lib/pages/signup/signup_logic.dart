import 'package:dio/dio.dart';
import 'package:docdoc/core/local_storage/LocalStorage.dart';
import 'package:docdoc/core/networking/apiconstant.dart';
import 'package:docdoc/pages/Home/U_I/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupLogic extends ChangeNotifier {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController confirmpasseordcontroller =
      TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController gendercontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  bool isLoading = false;

  Future<void> signup(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      try {
        final dio = Dio();
        final response = await dio.post(
          ApiConstants.register,
          data: {
            "name": namecontroller.text,
            "email": emailcontroller.text,
            "phone": phonecontroller.text,
            "gender": 0,
            "password": passwordcontroller.text,
            "password_confirmation": confirmpasseordcontroller.text,
          },
        );
        Fluttertoast.showToast(msg: 'You are registered successfully');
        final token = response.data['data']['token'];
        await LocalStorage.setString('token', token);
        isLoading = false;
        notifyListeners();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        notifyListeners();
      } on DioException catch (e) {
        isLoading = false;

        Fluttertoast.showToast(msg: 'You aren\'t registered successfully');
        print(e.response);
        notifyListeners();
      }
    }
  }
}
