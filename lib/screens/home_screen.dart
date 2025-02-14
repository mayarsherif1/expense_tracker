import 'package:expense_tracker/cubit/expense_cubit.dart';
import 'package:expense_tracker/cubit/expense_state.dart';
import 'package:expense_tracker/screens/add_expense_screen.dart';
import 'package:expense_tracker/screens/expense_list_screen.dart';
import 'package:expense_tracker/widgets/expense_chart.dart'; // Import the chart widget
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurple, // More vibrant color
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ExpenseCubit, ExpenseState>(
              builder: (context, state) {
                if (state is ExpenseLoaded) {
                  // Convert List<Expense> to Map<String, double> for the chart
                  Map<String, double> expenseData = {};
                  for (var expense in state.expenses) {
                    expenseData[expense.category] = (expenseData[expense.category] ?? 0) + expense.amount;
                  }

                  return Column(
                    children: [
                      // Total Expenses Display
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "Total Expenses: \$${state.total.toStringAsFixed(2)}",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
                        ),
                      ),
                      SizedBox(height: 16),
                      // Expense Pie Chart
                      ExpenseChart(data: expenseData),
                    ],
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
            SizedBox(height: 16),
            // Add Expense Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AddExpenseScreen())),
                icon: Icon(Icons.add, size: 24),
                label: Text("Add Expense", style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Expense List
            Expanded(child: ExpenseListScreen()),
          ],
        ),
      ),
    );
  }
}

