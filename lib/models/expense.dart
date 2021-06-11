class Expense {
  final int id;
  final String name;
  final int dateTimeStamp;
  final double amount;
  final String receiptUrl;
  final String notes;

  Expense(
      this.id,
      this.name,
      this.dateTimeStamp,
      this.amount,
      this.receiptUrl,
      this.notes);
}
