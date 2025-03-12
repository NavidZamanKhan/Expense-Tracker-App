import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/theme/theme_color.dart';
import 'package:expense_tracker/widget/chart/chart.dart';
import 'package:expense_tracker/widget/expenses_list/expenses_list.dart';
import 'package:expense_tracker/widget/new_expense_form.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Groceries",
      amount: 50.0,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Shoes",
      amount: 100.0,
      date: DateTime.now(),
      category: Category.shopping,
    ),
    Expense(
      title: "Flight",
      amount: 300.0,
      date: DateTime.now(),
      category: Category.travel,
    ),
    Expense(
      title: "Banking Fee",
      amount: 45.0,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Gym Membership",
      amount: 60.0,
      date: DateTime.now(),
      category: Category.healthcare,
    ),
    Expense(
      title: "Movie Night",
      amount: 30.0,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _addNewExpense(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Expense Removed"),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: "Undo",
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void _openAddExpenseForm() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addNewExpense),
    );
  }

  @override
  Widget build(context) {
    // final length = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = Center(
      child: const Text(
        "No expenses added yet!\nTry adding some.",
        textAlign: TextAlign.center,
      ),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expenses Tracker",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: appColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.white),
            onPressed: _openAddExpenseForm,
          ),
        ],
      ),
      body:
          width < 600
              ? Column(
                children: [
                  Chart(expenses: _registeredExpenses),
                  Expanded(child: mainContent),
                ],
              )
              : Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(child: Chart(expenses: _registeredExpenses)),
                      ],
                    ),
                  ),
                  Expanded(child: mainContent),
                ],
              ),
    );
  }
}
