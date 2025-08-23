import 'package:docdoc/core/customs/custom_button.dart';
import 'package:docdoc/core/customs/custom_text_field.dart';
import 'package:docdoc/core/styles/colors.dart';
import 'package:docdoc/pages/Home/U_I/home_screen.dart';
import 'package:docdoc/pages/signIn/signin_screen.dart';
import 'package:docdoc/pages/signup/signup_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupLogic(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<SignupLogic>(
          builder: (context, signup, _) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: signup.formkey,
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

                      CustomTextFormField(
                        label: "Name",
                        controller: signup.namecontroller,
                      ),
                      CustomTextFormField(
                        label: "Email",
                        controller: signup.emailcontroller,
                      ),
                      CustomTextFormField(
                        label: "Phone",
                        controller: signup.phonecontroller,
                      ),
                      CustomTextFormField(
                        label: "gender",
                        controller: signup.gendercontroller,
                      ),
                      CustomTextFormField(
                        label: "Password",
                        controller: signup.passwordcontroller,
                        isPassword: true,
                      ),
                      CustomTextFormField(
                        label: "Confirm password",
                        controller: signup.confirmpasseordcontroller,
                        isPassword: true,
                      ),

                      Center(
                        child: PrimaryButton(
                          onPressed: () {
                            signup.signup(context);
                          },
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
