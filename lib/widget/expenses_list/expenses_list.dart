import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder:
          (ctx, index) => Dismissible(
            key: ValueKey(ExpensesItem(expenses[index])),
            onDismissed: (direction) => onRemoveExpense(expenses[index]),
            background: Container(
              color: Colors.redAccent,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    "Deleted",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  Spacer(),
                  const Icon(Icons.delete, color: Colors.black, size: 40),
                ],
              ),
            ),
            child: ExpensesItem(expenses[index]),
          ),
    );
  }
}
