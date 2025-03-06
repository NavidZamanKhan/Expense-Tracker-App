import 'package:flutter/material.dart';
import 'package:expense_tracker/widget/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.orangeAccent);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(),
        cardTheme: CardTheme().copyWith(
          color: kColorScheme.surfaceContainerLow,
        ),
      ),
      home: Expenses(),
    ),
  );
}
