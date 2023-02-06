import 'package:chat/pages/loading_page.dart';
import 'package:chat/providers/auth_service.dart';
import 'package:chat/providers/socket_provider.dart';
import 'package:flutter/material.dart';

import 'package:chat/routes/routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context) =>  AuthProvider()),
        ChangeNotifierProvider(create: (context) => SocketService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
        initialRoute: LoadingPage.route,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
