import 'package:docdoc/core/customs/custom_button.dart';
import 'package:docdoc/core/customs/custom_text_field.dart';
import 'package:docdoc/core/styles/colors.dart';
import 'package:docdoc/pages/signIn/signin_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SigninLogic(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<SigninLogic>(
          builder: (context, signin, _) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: signin.formkey,
                  child: Column(
                    spacing: 15,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: ColorCore.primary,
                        ),
                      ),
                      Text(
                        "We're excited to have you back, can't wait to\nsee what you've been up to since you last\nlogged in.",
                        style: TextStyle(
                          color: ColorCore.cl1,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.start,
                      ),

                      CustomTextFormField(
                        label: "Email",
                        controller: signin.emailcontroller,
                      ),
                      CustomTextFormField(
                        label: "password",
                        controller: signin.passwordcontroller,
                      ),
                      Center(
                        child: PrimaryButton(
                          onPressed: () {},
                          text: "Create Account",
                        ),
                      ),

                      Row(
                        spacing: 1,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account ?",
                            style: TextStyle(
                              color: ColorCore.cl1,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SigninScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                color: ColorCore.primary,
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
