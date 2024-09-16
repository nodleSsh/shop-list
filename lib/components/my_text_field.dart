import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  const MyTextField({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Colors.grey[700],
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Color.fromRGBO(255, 255, 255, 0.9),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Color.fromRGBO(255, 255, 255, 0.5),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
        ),
        hintText: hintText,
        hintMaxLines: 1,
        hintStyle: TextStyle(
          color: Colors.grey[600]
        ),
        filled: true,
        fillColor: const Color.fromRGBO(255, 255, 255, 0.3),
        contentPadding: const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
      ),
      obscureText: obscureText,
    );
  }
}
