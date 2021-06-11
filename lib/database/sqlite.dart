import 'dart:io' as io;

import "package:path/path.dart";
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'expense_table.dart';

class SqliteDB {
  static final _databaseName = 'TaxAssistantDatabase.db';
  static final _databaseVersion = 1;
  static final SqliteDB _instance = new SqliteDB.internal();

  factory SqliteDB() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  SqliteDB.internal();

  initDb() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    var taskDb = await openDatabase(path, version: _databaseVersion);
    ExpenseTable.onCreateExpenseTable(taskDb, _databaseVersion);
    return taskDb;
  }

  Future countTable() async {
    var dbClient = await db;
    var res =
        await dbClient.rawQuery("""
          SELECT count(*) as count FROM sqlite_master
          WHERE type = 'table'
          AND name != 'android_metadata'
          AND name != 'sqlite_sequence';
        """);
    return res[0]['count'];
  }
}
