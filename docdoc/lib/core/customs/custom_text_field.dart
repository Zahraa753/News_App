import 'package:docdoc/core/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String? hint;
  final IconData? prefixIcon;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    Key? key,
    required this.label,
    this.hint,
    this.prefixIcon,
    this.isPassword = false,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: ColorCore.cl2),
        ),
      ),
    );
  }
}
