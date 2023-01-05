import 'package:flutter/cupertino.dart';
import 'package:qr_reader/pages/home_page.dart';
import 'package:qr_reader/pages/mapa_page.dart';

class AppRouter {
  
  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case HomePage.routeName:
        return CupertinoPageRoute(builder: (context) => const HomePage(),);
      case MapaPage.routeName:
        return CupertinoPageRoute(builder: (context) => MapaPage(),settings: settings );
      default:
    }
    return null;
  }
}