import 'package:band_names/router/app_router.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom package',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.initialrotuer,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}