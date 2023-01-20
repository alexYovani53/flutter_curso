import 'package:fl_components/util/app_color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData.light().copyWith(
      primaryColor: AppColor.shared.primary,
      appBarTheme: AppBarTheme(color: AppColor.shared.primary),
      textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: Colors.red)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: AppColor.shared.primary)
      ), 
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: TextStyle(color:AppColor.shared.secondary), 
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.shared.secondary), 
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.shared.secondary), 
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10))
        )
      )
  );
}
