import 'package:flutter/material.dart';

import 'package:band_names/pages/home_page.dart';

class AppRouter {

  static String initialrotuer = HomePage.routeName;
  
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => const HomePage());
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }

}