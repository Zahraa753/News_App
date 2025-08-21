import 'package:docdoc/core/customs/custom_button.dart';
import 'package:docdoc/core/customs/custom_text_field.dart';
import 'package:docdoc/core/styles/colors.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 15,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Account",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: ColorCore.primary,
                ),
              ),
              Text(
                "Sign up now and start exploring all that our\n app has to offer. We're excited to welcome\n you to our community!",
                style: TextStyle(
                  color: ColorCore.cl1,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.start,
              ),

              CustomTextFormField(label: "Email", controller: emailcontroller),
              CustomTextFormField(
                label: "password",
                controller: passwordcontroller,
              ),
              Center(
                child: PrimaryButton(onPressed: () {}, text: "Create Account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
