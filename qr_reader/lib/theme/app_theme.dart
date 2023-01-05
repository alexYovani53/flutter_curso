import 'package:flutter/material.dart';
import 'package:qr_reader/utils/app_color.dart';

class AppTheme {
  static ThemeData themeData = ThemeData.light().copyWith(
      primaryColor: AppColor.shared.primary,
      appBarTheme: AppBarTheme(backgroundColor: AppColor.shared.primary),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColor.shared.primary
      )
  );
}
