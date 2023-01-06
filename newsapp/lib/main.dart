import 'package:flutter/material.dart';
import 'package:newsapp/pages/tabs_page.dart';
import 'package:newsapp/router/app_router.dart';
import 'package:newsapp/services/news_service.dart';
import 'package:newsapp/theme/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsService(), lazy: false)
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.miTema,
      initialRoute: TabsPage.routeName,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
