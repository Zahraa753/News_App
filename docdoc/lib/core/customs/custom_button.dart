import 'package:docdoc/core/styles/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const PrimaryButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Container(
        width: 311,
        height: 52,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: ColorCore.primary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
