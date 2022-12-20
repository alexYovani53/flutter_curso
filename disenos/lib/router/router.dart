import 'package:disenos/pages/basic_desing.dart';
import 'package:disenos/pages/scroll_page.dart';
import 'package:flutter/material.dart';

class RouterApp{
  
  static Route<dynamic>? onGenerateRoute(RouteSettings route){
    switch (route.name) {
      case BasicDesingPage.routeName:
        return MaterialPageRoute(builder: (context) => const BasicDesingPage());
        
      case ScrollPage.routeName:
        return MaterialPageRoute(builder: (context) => const ScrollPage());
    }
    return null;
  }
}