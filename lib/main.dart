import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:expense_tracker/widget/expenses.dart';
import 'package:google_fonts/google_fonts.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.orangeAccent);
var kDarkColorScheme = ColorScheme.fromSeed(
  // brightness: Brightness.dark,
  seedColor: Colors.orangeAccent,
);

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]).then((fn) {
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

        ///inputDecorationTheme
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            gapPadding: 4,
          ),
        ),
      ),

      ///theme
      theme: ThemeData().copyWith(
        ///colorScheme
        colorScheme: kColorScheme,

        ///appBarTheme
        appBarTheme: AppBarTheme().copyWith(),

        ///cardTheme
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.surfaceContainerLow,
          margin: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),

        ///filledButtonTheme
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            elevation: 2,
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kColorScheme.onPrimaryContainer,
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
      themeMode: ThemeMode.light,
      home: Expenses(),
    ),
  );
  // });
}
