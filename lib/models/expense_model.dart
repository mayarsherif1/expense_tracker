
// Expense Model
class Expense {
  final String id;
  final String description;
  final double amount;
  final String category;
  final DateTime date;

  Expense({
    required this.id,
    required this.description,
    required this.amount,
    required this.category,
    required this.date,
  });
}
