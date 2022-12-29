import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;
  ThemeProvider({
    required bool isDarkMode,
  }): currentTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();

  setTheme(bool darkMode){
    currentTheme = darkMode ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }
}
