import 'dart:async';

import 'package:CookingApp/dao/cook_dao.dart';
import 'package:CookingApp/models/cooks.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'cookdb.g.dart';

@Database(version: 1, entities: [Cook])
abstract class CookDataBase extends FloorDatabase {
  CookDAO get cookDAO;
}
