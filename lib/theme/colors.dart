import 'package:flutter/material.dart';

class ThemeColor {
  static const bgColor = Color(0XFFF8E8EE);
  static const gradientBg = LinearGradient(
    colors: [Colors.red, Colors.blue],
    begin: Alignment.topLeft, 
    end: Alignment.bottomRight,
    tileMode: TileMode.mirror
  );
  static const gradient = LinearGradient(
        colors: [
           Color(0XFFFFEBD4),
           Color(0XFFFFC6C6),
           Color(0XFFF0A8D0),
        ],
      );
}

 
