import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'expense_table.dart';

class DatabaseHelper {
  static final _databaseName = 'TaxAssistantDatabase.db';
  static final _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
      path,
    version: _databaseVersion,
    onCreate: _onCreate
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${ExpenseTable.tableName} (
          ${ExpenseTable.columnId} INTEGER PRIMARY KEY,
          ${ExpenseTable.columnName} TEXT NOT NULL,
          ${ExpenseTable.columnDateTimeStamp} TEXT NOT NULL,
          ${ExpenseTable.columnAmount} REAL NOT NULL,
          ${ExpenseTable.columnReceiptUrl} TEXT NOT NULL,
          ${ExpenseTable.columnNote} TEXT NOT NULL
        )
        '''
    );
  }

}