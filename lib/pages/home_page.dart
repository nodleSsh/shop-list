import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoplist/components/new_shop_dialog.dart';
import 'package:shoplist/components/logo.dart';
import 'package:shoplist/components/web_view.dart';
import 'package:shoplist/main.dart';
import 'package:shoplist/models/shop.dart';
import 'package:shoplist/models/shop_database.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
    readShop();
    super.initState();
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
                    color: Color.fromRGBO(77, 77, 77, 0.5),
                  ),
                ),
                onPressed: () {
                  context
                      .read<ShopDatabase>()
                      .addShop(nameController.text, linkController.text);
                  nameController.clear();
                  linkController.clear();
                  Navigator.pop(context);
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
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

  void readShop() {
    context.read<ShopDatabase>().fetchShop();
  }

  void updateShop(Shop shop) {
    nameController.text = shop.name;
    linkController.text = shop.link;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Container(
          height: 250,
          child: Column(
            children: [
              Text(
                textAlign: TextAlign.center,
                'Update Note',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Column(
                children: [
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
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  context.read<ShopDatabase>().updateShop(
                      shop.id, nameController.text, linkController.text);
                  nameController.clear();
                  linkController.clear();
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(
                    width: 1,
                    color: Color.fromRGBO(77, 77, 77, 0.5),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void deleteShop(int id) {
    context.read<ShopDatabase>().deleteShop(id);
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
            onPressed: () {
              Navigator.pushNamed(context, '/login_page');
            },
            icon: const Icon(Icons.logout_outlined,color: Color(0xff603F26),),
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
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 255, 255, 0.4),
                    borderRadius: BorderRadius.circular(20),
                    border: const Border(
                      top: BorderSide(
                        width: 1.5,
                        color: Color.fromRGBO(255, 255, 255, 0.9),
                      ),
                      left: BorderSide(
                          width: 1.5,
                          color: Color.fromRGBO(255, 255, 255, 0.9)),
                    ),
                  ),
                  child: ListTile(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        shop.name,
                        style: const TextStyle(
                          color: Color(0xFF6C4E31),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    subtitle: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WebView(link: shop.link)));
                      },
                      child: Container(
                        child: const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Go to the store',
                                style: TextStyle(
                                  color: Color(0xff603F26),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(Icons.arrow_forward_ios_outlined, size: 14, color: Color(0xff603F26),),
                            ],
                          ),
                        ),
                      ),
                    ),
                    trailing: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            color: const Color(0xff603F26),
                            onPressed: () => updateShop(shop),
                            icon: const Icon(Icons.edit_outlined),
                          ),
                          SizedBox(
                            height: 30, 
                            width: 1, 
                            child: Container.new(
                              color: const Color(0xff603F26),
                            ),
                          ),
                          IconButton(
                            color: const Color(0xff603F26),
                            onPressed: () => deleteShop(shop.id),
                            icon: const Icon(Icons.delete_outline),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(
          Icons.add,
          color: Color(0xff603F26),
        ),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 0.5),
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Color.fromRGBO(255, 255, 255, 0.8),
          ),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}

//добавить обработку добавления новых сторов, если пустые поля, то не добавляем
//додумать дизайн есть нектр сложности с цветами - не красиво сейчас 
//застилизовать дилоговые окна под общую картину приложения
//при скроле убрать у апп бар тень



