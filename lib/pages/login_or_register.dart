import 'package:flutter/material.dart';
import 'package:shoplist/pages/login_page.dart';
import 'package:shoplist/theme/colors.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginPage(),
    );
  }
}