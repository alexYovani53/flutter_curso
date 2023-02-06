import 'package:chat/pages/chat_page/chat_page.dart';
import 'package:chat/pages/loading_page.dart';
import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/register_page.dart';
import 'package:chat/pages/usuarios_page.dart';
import 'package:flutter/material.dart';


Route<dynamic> onGenerateRoute(RouteSettings settings)  {

  switch (settings.name) {
    case ChatPageInit.routeName:
      return MaterialPageRoute(builder: (context) =>ChatPageInit(), settings: settings);
    case LoadingPage.route:
      return MaterialPageRoute(builder: (context) =>LoadingPage());
    case LoginPage.route:
      return MaterialPageRoute(builder: (context) =>LoginPage());
    case RegisterPage.route:
      return MaterialPageRoute(builder: (context) =>RegisterPage());
    case UsuariosPage.route:
      return MaterialPageRoute(builder: (context) =>UsuariosPage());
    default:
      return MaterialPageRoute(builder: (context) =>LoginPage());
  }
}


