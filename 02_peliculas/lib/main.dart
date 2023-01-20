import 'package:flutter/material.dart';
import 'package:peliculas/providers/movie_provider.dart';
import 'package:peliculas/router/app_router.dart';
import 'package:peliculas/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => MovieProvider(), lazy: false)
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Peliculas',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.initialRouter,
        routes: AppRouter.router,
        theme: AppTheme.themeData,
        home: Container());
  }
}
