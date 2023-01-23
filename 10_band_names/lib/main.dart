import 'package:band_names/router/app_router.dart';
import 'package:band_names/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SocketService(), lazy: false,)
      ],
      child: MaterialApp(
        title: 'Custom package',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.initialrotuer,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}