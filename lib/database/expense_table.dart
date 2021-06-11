import 'package:sqflite/sqflite.dart';

class ExpenseTable {
  static final tableName = 'expense_table';
  static final columnId = '_id';
  static final columnName = '_name';
  static final columnDateTimeStamp = '_date_time_stamp';
  static final columnAmount = '_amount';
  static final columnReceiptUrl = '_receipt_url';
  static final columnNote = '_columnNote';

  static Future onCreateExpenseTable(Database db, int version) async {
    await db.execute('''
      CREATE TABLE ${ExpenseTable.tableName} (
          ${ExpenseTable.columnId} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          ${ExpenseTable.columnName} TEXT NOT NULL,
          ${ExpenseTable.columnDateTimeStamp} TEXT NOT NULL ,
          ${ExpenseTable.columnAmount} REAL NOT NULL,
          ${ExpenseTable.columnReceiptUrl} TEXT NOT NULL,
          ${ExpenseTable.columnNote} TEXT NOT NULL
        )
        ''');
  }
}
