import 'package:flutter/material.dart';
import 'package:productos_app/pages/home_page.dart';
import 'package:productos_app/router/app_router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      onGenerateRoute: AppRouter.onCreateRouter,
    );
  }
}