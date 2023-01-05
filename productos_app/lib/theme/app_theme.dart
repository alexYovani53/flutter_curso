import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData theme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.grey,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: Colors.indigo
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      elevation: 0,
      backgroundColor: Colors.indigo
    )
  );
}