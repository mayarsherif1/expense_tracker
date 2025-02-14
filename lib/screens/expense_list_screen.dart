import 'package:expense_tracker/cubit/expense_cubit.dart';
import 'package:expense_tracker/cubit/expense_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpenseListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expenses")),
      body: BlocBuilder<ExpenseCubit, ExpenseState>(
        builder: (context, state) {
          if (state is ExpenseLoaded) {
            return ListView.builder(
              itemCount: state.expenses.length,
              itemBuilder: (context, index) {
                final expense = state.expenses[index];
                return ListTile(
                  title: Text(expense.description),
                  subtitle: Text("${expense.category} - \$${expense.amount.toStringAsFixed(2)}"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      context.read<ExpenseCubit>().deleteExpense(expense.id);
                    },
                  ),
                );
              },
            );
          }
          return Center(child: Text("No expenses yet"));
        },
      ),
    );
  }
}
