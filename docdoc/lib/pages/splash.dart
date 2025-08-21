import 'package:docdoc/pages/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset("assets/svg/Group (1).svg"),

            SvgPicture.asset("assets/svg/Frame 1000005357.svg"),
          ],
        ),
      ),
    );
  }
}
