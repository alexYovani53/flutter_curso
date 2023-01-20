import 'package:flutter/material.dart';
import 'package:productos_app/pages/pages.dart';
import 'package:productos_app/router/app_router.dart';
import 'package:productos_app/services/auth_services.dart';
import 'package:productos_app/services/notifications_service.dart';
import 'package:productos_app/services/product_services.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>AuthService(), lazy: false),
        ChangeNotifierProvider(create: (context) =>ProductsServices(), lazy: false)
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
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: CheckAuthScreen.routeName,
      scaffoldMessengerKey: NotificationsService.messengerKey,
      onGenerateRoute: AppRouter.onCreateRouter,
    );
  }
}