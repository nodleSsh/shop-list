import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shoplist/models/shop.dart';

class ShopDatabase extends ChangeNotifier{
  static late Isar isar;
  static Future<void> initialize() async{
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [ShopSchema], 
      directory: dir.path,
    );
  }
  final List<Shop> currentShop = [];
  Future<void> addShop(String name, String link) async{
    final newShop = Shop();
    newShop.name = name;
    newShop.link = link;

    await isar.writeTxn(() => isar.shops.put(newShop));
    fetchShop();
  }

  Future<void> fetchShop() async{
    List<Shop> fetcheShop = await isar.shops.where().findAll();
    currentShop.clear();
    currentShop.addAll(fetcheShop);
    notifyListeners();
  }

  Future<void> updateShop(int id, String name, String link) async{
    final existingShop = await isar.shops.get(id);
    if(existingShop != null){
      existingShop.name = name;
      existingShop.link = link;
      await isar.writeTxn(() => isar.shops.put(existingShop));
      await fetchShop();
    }
  }

  Future<void> deleteShop(int id)async{
    await isar.writeTxn(() => isar.shops.delete(id));
    await fetchShop();
  }


}


