import 'package:flutter/material.dart';
import 'package:notifications_app/pages/home_page.dart';
import 'package:notifications_app/pages/message_page.dart';
import 'package:notifications_app/router/app_router.dart';
import 'package:notifications_app/services/push_notification_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final GlobalKey<ScaffoldMessengerState> messangerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    PushNotificationService.messagesStream.listen((event) {
      
      navigatorKey.currentState?.pushNamed(MessagePage.routeName, arguments: event);

      final snackBar = SnackBar(content: Text(event));
      messangerKey.currentState!.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notificaciones',
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: messangerKey,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}