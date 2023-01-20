import 'package:flutter/material.dart';
import 'package:mapbox_mapas/pages/full_screen_map.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: FullScreenMap()
    );
  }
}