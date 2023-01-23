import 'package:band_names/pages/status_page.dart';
import 'package:flutter/material.dart';

import 'package:band_names/pages/home_page.dart';

class AppRouter {

  static String initialrotuer = StatusPage.routeName;
  
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case StatusPage.routeName:
        return MaterialPageRoute(builder: (context) => const StatusPage());
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }

}