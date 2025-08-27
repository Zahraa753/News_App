import 'package:appone/core/customs_helper/Custom_text_field.dart';
import 'package:appone/core/designing/colors.dart';
import 'package:appone/features/register/logic/regiter_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Rigister extends StatelessWidget {
  const Rigister({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterLogic(),
      child: Scaffold(
        body: Consumer<RegisterLogic>(
          builder: (context, prov, _) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Form(
                  key: prov.formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      Text(
                        "Register page",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomTextFormField(
                        controller: prov.namecontroller,
                        hintText: "Name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        controller: prov.emailcontroller,
                        hintText: "Email",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),

                      CustomTextFormField(
                        controller: prov.phonecontroller,
                        hintText: "phone",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        controller: prov.passwordcontroller,
                        hintText: "password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      CustomTextFormField(
                        controller: prov.confirmpasswordcontroller,
                        hintText: "Confirm password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your confirm password';
                          } else {
                            return null;
                          }
                        },
                      ),
                      prov.isLoading
                          ? CircularProgressIndicator()
                          : MaterialButton(
                              onPressed: () {
                                prov.register(context);
                              },

                              color: Colors.blue,
                              padding: EdgeInsets.all(10),
                              minWidth: double.infinity,
                              child: Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
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
