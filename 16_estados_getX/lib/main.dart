import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:estados/pages/pagina1_page.dart';
import 'package:estados/pages/pagina2_page.dart';

 
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: Pagina1Page.routeName,
      getPages: [
        GetPage(name: Pagina1Page.routeName, page: () => const Pagina1Page() ),
        GetPage(name: Pagina2Page.routeName, page: () => const Pagina2Page() )
      ],
    );
  }
}