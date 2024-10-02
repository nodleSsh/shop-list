import 'package:flutter/material.dart';

void displayMessageToUser(String message, BuildContext context){
  showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(message, style: TextStyle(
          color: Colors.grey[700],
          fontSize: 19,
          letterSpacing: 1,
        ),),
      ),
    ),
  );
} 