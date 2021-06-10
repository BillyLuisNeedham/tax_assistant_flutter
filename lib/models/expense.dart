class Expense {
  final int id;
  final String name;
  final int dateTimeStamp;
  final double amount;
  final String recieptUrl;
  final String notes;

  Expense(
      {required this.id,
      required this.name,
      required this.dateTimeStamp,
      required this.amount,
      required this.recieptUrl,
      required this.notes});
}
