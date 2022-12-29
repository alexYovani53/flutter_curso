import 'package:flutter/material.dart';
import 'package:preferences_app/pages/home_page.dart';
import 'package:preferences_app/provider/theme_provider.dart';
import 'package:preferences_app/routers/app_router.dart';
import 'package:preferences_app/utils/app_preferences.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences2.shared.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(isDarkMode: Preferences2.shared.mode)),
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
      initialRoute: HomePage.routeName,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}