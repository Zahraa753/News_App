import 'package:appone/core/widgets/custom_button.dart';
import 'package:appone/core/widgets/custom_text_field.dart';
import 'package:appone/features/login/logic/login_provider.dart';
import 'package:appone/features/register/ui/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      builder: (context, child) {
        final provider = context.read<LoginProvider>();
        return Scaffold(
          appBar: AppBar(title: const Text('Login')),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                spacing: 20,
                children: [
                  Text(
                    'Welcome Back!.',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: provider.formKey,
                        child: Column(
                          spacing: 16,
                          children: [
                            CustomTextField(
                              controller: provider.emailController,
                              hintText: 'Email Address',
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                            ),
                            CustomTextField(
                              controller: provider.passwordController,
                              hintText: 'Password',
                              obscureText: true,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                            Consumer<LoginProvider>(
                              builder: (context, _, __) {
                                if (provider.isLoading) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return CustomButton(
                                  onPressed: () {
                                    provider.login(context);
                                  },
                                  text: 'Login',
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Are you haven\'t already an account ?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: Text('Sign Up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
