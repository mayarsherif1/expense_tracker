import 'package:expense_tracker/cubit/expense_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpenseScreen extends StatelessWidget {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final List<String> categories = ["Food", "Transport", "Shopping", "Other"];
  String selectedCategory = "Food";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Expense")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: descriptionController, decoration: InputDecoration(labelText: "Description")),
            TextField(controller: amountController, decoration: InputDecoration(labelText: "Amount"), keyboardType: TextInputType.number),
            DropdownButtonFormField(
              value: selectedCategory,
              items: categories.map((category) {
                return DropdownMenuItem(value: category, child: Text(category));
              }).toList(),
              onChanged: (value) => selectedCategory = value!,
              decoration: InputDecoration(labelText: "Category"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final description = descriptionController.text;
                final amount = double.tryParse(amountController.text) ?? 0;
                if (description.isNotEmpty && amount > 0) {
                  context.read<ExpenseCubit>().addExpense(description, amount, selectedCategory);
                  Navigator.pop(context);
                }
              },
              child: Text("Add Expense"),
            ),
          ],
        ),
      ),
    );
  }
}
