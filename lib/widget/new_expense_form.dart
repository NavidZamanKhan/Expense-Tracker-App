import 'dart:io';

import 'package:expense_tracker/theme/theme_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expense.dart';

final formatter = DateFormat.yMMMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  ///_presentDatePicker
  Future<void> _presentDatePicker() async {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    if (isKeyboardOpen) {
      FocusScope.of(context).unfocus();
      await Future.delayed(const Duration(milliseconds: 200));
    }
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 25, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
      initialDate: now,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: appColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            datePickerTheme: DatePickerThemeData(
              headerBackgroundColor: appColor,
              backgroundColor: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _showDialog() {
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder:
            (ctx) => AlertDialog(
              title: const Text("Invalid Input"),
              content: const Text("Please enter valid title, amount and date."),
              actions: [
                FilledButton(
                  style: FilledButton.styleFrom(backgroundColor: appColor),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Okay",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder:
            (ctx) => CupertinoAlertDialog(
              title: const Text("Invalid Input"),
              content: const Text("Please enter valid title, amount and date."),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Okay"),
                ),
              ],
            ),
      );
    }
  }

  Future<void> _submitExpenseData() async {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    if (isKeyboardOpen) {
      FocusScope.of(context).unfocus();
      await Future.delayed(const Duration(milliseconds: 200));
    }
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      return _showDialog();
    }
    widget.onAddExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(
      builder: (ctx, constraints) {
        // final width = constraints.maxWidth;

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(8, 16, 8, keyboardSpace + 32),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(0, 255, 255, 255),
                    ),
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 2,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        // if (width >= 600)
                        //   Row(
                        //     children: [

                        //     ],
                        //   )
                        // else
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 16,
                                bottom: 32,
                              ),
                              child: Text(
                                "Add New Expense",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ),
                          ],
                        ),

                        ///TextFields
                        TextField(
                          maxLength: 40,
                          controller: _titleController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            labelText: "Title",
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              ///TextField
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: TextField(
                                  controller: _amountController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    labelText: "Amount",
                                    labelStyle: TextStyle(color: Colors.black),
                                    prefixText: "\$",
                                    hintText: "Enter the amount of the expense",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            ///DropdownButton
                            DropdownButton(
                              value: _selectedCategory,
                              items:
                                  Category.values
                                      .map(
                                        (category) => DropdownMenuItem(
                                          value: category,
                                          child: Text(
                                            category.name.toUpperCase(),
                                          ),
                                        ),
                                      )
                                      .toList(),
                              onChanged:
                                  (value) => setState(() {
                                    if (value == null) return;
                                    _selectedCategory = value;
                                  }),
                            ),

                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    _selectedDate == null
                                        ? "No date selected"
                                        : formatter.format(_selectedDate!),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  IconButton(
                                    onPressed: _presentDatePicker,
                                    icon: const Icon(
                                      Icons.calendar_month_rounded,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cancel",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      FilledButton(
                        onPressed: () {
                          _submitExpenseData();
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: appColor,
                        ),
                        child: const Text(
                          "Add Expense",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
