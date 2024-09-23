import 'package:flutter/material.dart';

class NewShopDialog extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  const NewShopDialog({super.key, required this.hintText, required this.controller,});

  @override
  State<NewShopDialog> createState() => _NewShopDialogState();
}

class _NewShopDialogState extends State<NewShopDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: widget.controller,
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Color.fromRGBO(77, 77, 77, 0.9),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Color.fromRGBO(77, 77, 77, 0.5),
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(77, 77, 77, 1),
            ),
          ),
          hintText: widget.hintText,
          hintMaxLines: 1,
          hintStyle: TextStyle(
            color: Colors.grey[600]
          ),
          filled: true,
          fillColor: const Color.fromRGBO(255, 255, 255, 0.3),
          contentPadding: const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
        ),
      ),
    );
  }
}