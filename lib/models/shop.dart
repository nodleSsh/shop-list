

import 'package:isar/isar.dart';
part 'shop.g.dart';

@Collection()
class Shop{
  Id id = Isar.autoIncrement;
  late String name;
  late String link;
}