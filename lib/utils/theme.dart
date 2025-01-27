import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.dark(),
    backgroundColor: Colors.grey.shade300,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
      backgroundColor: Colors.grey.shade300,
    ),
    primaryColor: Colors.blue,
    accentColor: Colors.red,
    buttonColor: Colors.black,
  );

  final dartTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.light(),
    backgroundColor: Colors.grey.shade800,
    primaryColor: Colors.blue,
    buttonColor: Colors.white,
    accentColor: Colors.blueAccent,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: Colors.blueAccent,
    ),
  );
}
