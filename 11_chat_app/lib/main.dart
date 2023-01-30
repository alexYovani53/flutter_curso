import 'package:chat/pages/login_page.dart';
import 'package:flutter/material.dart';

import 'package:chat/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat App',
      initialRoute: LoginPage.route,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
