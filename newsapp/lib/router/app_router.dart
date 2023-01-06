import 'package:flutter/material.dart';
import 'package:newsapp/pages/tabs_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case TabsPage.routeName:
        return MaterialPageRoute(builder: (context) => const TabsPage());
      default:
        return MaterialPageRoute(builder: (context) => const TabsPage());
    }
  }
}
