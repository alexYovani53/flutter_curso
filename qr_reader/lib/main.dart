import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/home_page.dart';
import 'package:qr_reader/provider/page_state_provider.dart';
import 'package:qr_reader/provider/scan_list_provider.dart';
import 'package:qr_reader/routes/app_router.dart';
import 'package:qr_reader/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageStateProvider()),
        ChangeNotifierProvider(create: (context) => ScanListProvider()),
      ],
      child: MaterialApp(
        title: 'Material App',
        initialRoute: HomePage.routeName,
        theme: AppTheme.themeData,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
