import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productos_app/pages/check_auth_screen.dart';
import 'package:productos_app/pages/pages.dart';
import 'package:productos_app/pages/product_page.dart';
import 'package:productos_app/pages/register_page.dart';

class AppRouter{
  static Route<dynamic>? onCreateRouter(RouteSettings settings){
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case LoginPage.routeName:
        return CupertinoPageRoute(builder: (context) => const LoginPage());
      case RegisterPage.routeName:
        return CupertinoPageRoute(builder: (context) => const RegisterPage());
      case ProductPage.routeName:
        return MaterialPageRoute(builder: (context) => ProductPage());
      case CheckAuthScreen.routeName:
        return MaterialPageRoute(builder: (context) => const CheckAuthScreen());
    }
    return null;
  }
}