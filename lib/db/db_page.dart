import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DataBase {
  void init() async {
    WidgetsFlutterBinding.ensureInitialized();
    final db = await openDatabase('my_db.db');

  final path=  await getDatabasesPath();

  }
}
