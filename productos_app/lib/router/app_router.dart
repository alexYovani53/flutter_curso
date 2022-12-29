import 'package:flutter/material.dart';
import 'package:productos_app/pages/pages.dart';
import 'package:productos_app/pages/product_page.dart';

class AppRouter{
  static Route<dynamic>? onCreateRouter(RouteSettings settings){
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case LoginPage.routeName:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case ProductPage.routeName:
        return MaterialPageRoute(builder: (context) => const ProductPage());
    }
    return null;
  }
}