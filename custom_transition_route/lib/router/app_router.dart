import 'package:custom_transition_route/pages/page1.dart';
import 'package:custom_transition_route/pages/page2.dart';
import 'package:flutter/material.dart';

class AppRouter {

  static String initialrotuer = Page1.routeName;
  
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case Page1.routeName:
        return MaterialPageRoute(builder: (context) => const Page1());
      case Page2.routeName:
        return MaterialPageRoute(builder: (context) => const Page2());
      default:
        return MaterialPageRoute(builder: (context) => const Page1());
    }
  }

}