import 'package:flutter/material.dart';
import 'package:shoplist/components/new_shop_dialog.dart';
import 'package:shoplist/components/logo.dart';
import 'package:shoplist/components/my_text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          height: 300,
          child: Column(
            children: [
              Text(
                'Add new shop',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const NewShopDialog(hintText: 'Name'),
              const SizedBox(
                height: 10,
              ),
              const NewShopDialog(hintText: 'Link'),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                      child: Text(
                        'Add to my list',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(77, 77, 77, 0.5),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Ink(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0XFFFFEBD4),
                  Color(0XFFFFC6C6),
                  Color(0XFFF0A8D0),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.mirror),
          ),
          child: Container(
            width: double.infinity,
            child: const Column(
              children: [
                SafeArea(
                  child: Logo(),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),
    );
  }
}
