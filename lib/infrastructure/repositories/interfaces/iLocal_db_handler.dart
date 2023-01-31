

import 'package:sqflite/sqflite.dart';

abstract class ILocalDbHandler {
  Future<void> init();
  Future _onCreate(Database db, int version);
  Future<int> insert(Map<String, dynamic> row);
  Future<List<Map<String, dynamic>>> queryAllRows();
  Future<int> queryRowCount();
  Future<int> update(Map<String, dynamic> row);
  Future<int> delete(int id);
}