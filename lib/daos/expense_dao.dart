import 'package:sqflite/sqflite.dart';
import 'package:tax_assistant_flutter/database/expense_table.dart';
import 'package:tax_assistant_flutter/models/expense.dart';

class ExpensesDao {
  final Database db;

  ExpensesDao(this.db);

  Future insertExpense(Expense expense) async {
    dynamic exp = {
      ExpenseTable.columnName: expense.name,
      ExpenseTable.columnDateTimeStamp: expense.dateTimeStamp,
      //TODO finish method
    }
  }
}