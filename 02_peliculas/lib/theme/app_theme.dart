import 'package:flutter/material.dart';
import 'package:peliculas/util/app_color.dart';

class AppTheme {
  static ThemeData themeData = ThemeData.light().copyWith(
      primaryColor: AppColor.shared.primary,
      appBarTheme: AppBarTheme(backgroundColor: AppColor.shared.primary));
}
