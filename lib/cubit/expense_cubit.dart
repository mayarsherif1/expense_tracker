import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/expense_model.dart';
import 'expense_state.dart';

class ExpenseCubit extends Cubit<ExpenseState> {
  ExpenseCubit() : super(ExpenseInitial());

  final List<Expense> _expenses = [];

  void addExpense(String description, double amount, String category) {
    final newExpense = Expense(
      id: Random().nextInt(10000).toString(),
      description: description,
      amount: amount,
      category: category,
      date: DateTime.now(),
    );
    _expenses.add(newExpense);
    _updateState();
  }

  void deleteExpense(String id) {
    _expenses.removeWhere((expense) => expense.id == id);
    _updateState();
  }

  void _updateState() {
    double totalSum = _expenses.fold(0, (sum, item) => sum + item.amount);
    emit(ExpenseLoaded(List.from(_expenses), totalSum));
  }
}