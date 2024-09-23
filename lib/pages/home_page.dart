import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoplist/components/new_shop_dialog.dart';
import 'package:shoplist/components/logo.dart';
import 'package:shoplist/main.dart';
import 'package:shoplist/models/shop.dart';
import 'package:shoplist/models/shop_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController linkController = TextEditingController();
  // final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    readShop();
  }

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
              NewShopDialog(
                controller: nameController,
                hintText: 'Name',
              ),
              const SizedBox(
                height: 10,
              ),
              NewShopDialog(
                controller: linkController,
                hintText: 'Link',
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(
                    width: 1,
                    color:Color.fromRGBO(77, 77, 77, 0.5),
                  )
                ),
                onPressed: () {
                  context.read<ShopDatabase>().addShop(nameController.text, linkController.text);
                  nameController.clear();
                  linkController.clear();
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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
              const SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
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

  void readShop(){
    context.watch<ShopDatabase>().fetchShop();
  }

  @override
  Widget build(BuildContext context) {

    final shopDataBase = context.watch<ShopDatabase>();
    List<Shop> currentShops = shopDataBase.currentShop;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Logo(),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: (){}, 
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
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
          child: ListView.builder(
            itemCount: currentShops.length,
            itemBuilder: (context, index) {
              final shop = currentShops[index];
              return ListTile(
                title: Text(shop.name),
                subtitle: Text(shop.link),
              );
            },
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



/**
 * const SafeArea(
                child: Logo(),
              ),
 */