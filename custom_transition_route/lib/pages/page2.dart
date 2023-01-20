import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2 ({super.key});

  static const routeName = "page2"; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page2'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.amber,
      body: Center(
        child: MaterialButton(
          color: Colors.lightBlue,
          child: const Text('Ir de nuevo a pagina1'),
          onPressed: () =>Navigator.pop(context)
        ),
      ),
    );
  }
}