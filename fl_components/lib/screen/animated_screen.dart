import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({Key? key}) : super(key: key);

  static const routeName = "animated";

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double _with = 50;
  double _height = 50;
  Color _color = Colors.indigo;
  BorderRadiusGeometry _border = BorderRadius.circular(10);

  void changeShape() {
    final random = Random();
    _with = random.nextInt(300).toDouble() + 70;
    _height = random.nextInt(200).toDouble() + 10;
    _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    _border = BorderRadius.circular(40);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
          child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.bounceIn,
        width: _with,
        height: _height,
        decoration: BoxDecoration(
          color: _color,
          borderRadius: _border,
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_circle_outline, size: 35),
      ),
    );
  }
}
