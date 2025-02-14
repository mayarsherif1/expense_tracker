import '../models/expense_model.dart';

abstract class ExpenseState {}
class ExpenseInitial extends ExpenseState {}
class ExpenseLoaded extends ExpenseState {
  final List<Expense> expenses;
  final double total;

  ExpenseLoaded(this.expenses, this.total);
}