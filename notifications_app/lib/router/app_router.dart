import 'package:flutter/material.dart';
import 'package:notifications_app/pages/home_page.dart';
import 'package:notifications_app/pages/message_page.dart';

class AppRouter{

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case MessagePage.routeName:
        return MaterialPageRoute(builder: (context) => const MessagePage(), settings: settings);
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }

}

