import 'package:flutter/material.dart';
import 'package:shoplist/components/logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Ink(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0XFFF8E8EE),
                    Color(0XFFF2BED1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  tileMode: TileMode.mirror),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SafeArea(
                  child: Column(
                    children: [
                      Logo(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
