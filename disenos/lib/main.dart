import 'package:disenos/pages/scroll_page.dart';
import 'package:disenos/router/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: ScrollPage.routeName,
      onGenerateRoute: RouterApp.onGenerateRoute,
    );
  }
}
