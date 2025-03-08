import 'package:flutter/material.dart';
import 'package:expense_tracker/widget/expenses.dart';
import 'package:google_fonts/google_fonts.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.orangeAccent);
var kDarkColorScheme = ColorScheme.fromSeed(
  // brightness: Brightness.dark,
  seedColor: Colors.orangeAccent,
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        ///colorScheme
        colorScheme: kDarkColorScheme,

        ///appBarTheme
        appBarTheme: AppBarTheme().copyWith(),

        ///cardTheme
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),

        ///filledButtonTheme
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),

        ///popupMenuTheme
        popupMenuTheme: const PopupMenuThemeData().copyWith(
          color: kDarkColorScheme.surfaceContainerLow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),

        ///iconTheme
        iconTheme: const IconThemeData().copyWith(color: Colors.black),

        ///textTheme
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        ///colorScheme
        colorScheme: kColorScheme,

        ///appBarTheme
        appBarTheme: AppBarTheme().copyWith(),

        ///cardTheme
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.surfaceContainerLow,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),

        ///filledButtonTheme
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),

        ///popupMenuTheme
        popupMenuTheme: const PopupMenuThemeData().copyWith(
          color: kColorScheme.surfaceContainerLow,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),

        ///iconTheme
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        ///inputDecorationTheme
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            gapPadding: 4,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: Expenses(),
    ),
  );
}
