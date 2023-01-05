import 'package:flutter/cupertino.dart';
import 'package:preferences_app/pages/pages.dart';

class AppRouter{
  static Route<dynamic>? onGenerateRoute (RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return CupertinoPageRoute(builder: (context) => const HomePage());
      case SettingsScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const SettingsScreen());
    }
    return null;
  }
}