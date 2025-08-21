import 'package:docdoc/core/customs/custom_button.dart';
import 'package:docdoc/core/styles/colors.dart';
import 'package:docdoc/pages/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 8, right: 8, left: 8),
        child: Center(
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SafeArea(
                child: SvgPicture.asset(
                  height: 40,
                  width: 140,
                  "assets/svg/Frame 1000005357.svg",
                ),
              ),
              Stack(
                children: [
                  SvgPicture.asset("assets/svg/Group (1).svg"),
                  Image.asset("assets/images/Image.png"),
                  Positioned(
                    top: 200,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.white.withOpacity(0.1)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 5,
                    top: 400,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        "Best Doctor \n Appointment App",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: ColorCore.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),

              Center(
                child: Text(
                  "Manage and schedule all of your medical appointments easily \n with Docdoc to get a new experience",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: PrimaryButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  text: "Get Started",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
