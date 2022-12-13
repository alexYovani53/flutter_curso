import 'package:flutter/material.dart';

import 'package:peliculas/pages/pages.dart';

class AppRouter {
  static String initialRouter = "home";

  static Map<String, Widget Function(BuildContext)> router = {
    initialRouter: (p0) => const HomePage(),
    DetailsPage.routeName: (p0) => DetailsPage(),
  };
}
