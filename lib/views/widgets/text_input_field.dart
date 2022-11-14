import 'package:flutter/material.dart';
import 'package:tiktok_test/constants.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String label;
  final bool obscureText;
  const TextInputField({super.key, required this.controller, required this.icon, required this.label, this.obscureText = false,});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller ,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        label: Text(label),
        labelStyle: const TextStyle(
          fontSize: 20,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: borderColor)
          ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: borderColor,
          ),
        )
      ),
      obscureText: obscureText,
    );
  }
}