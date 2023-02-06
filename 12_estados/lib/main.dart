import 'package:estados/pages/pagina2_page.dart';
import 'package:flutter/material.dart';

import 'package:estados/pages/pagina1_page.dart';
 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: Pagina1Page.routeName,
      routes: {
        Pagina1Page.routeName: ( _ ) => const Pagina1Page(),
        Pagina2Page.routeName: ( _ ) => const Pagina2Page(),
      },
    );
  }
}