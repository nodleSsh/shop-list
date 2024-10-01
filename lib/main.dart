import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoplist/auth/login_or_register.dart';
import 'package:shoplist/components/web_view.dart';
import 'package:shoplist/firebase_options.dart';
import 'package:shoplist/models/shop_database.dart';
import 'package:shoplist/pages/home_page.dart';
import 'package:shoplist/pages/login_page.dart';
import 'package:shoplist/pages/register_page.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await ShopDatabase.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => ShopDatabase(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(),
      routes: {
        '/login_page': (context) => const LoginPage(),
        '/register_page': (context) => const RegisterPage(),
        '/home_page': (context) => const HomePage(),
      },
    );
  }
}