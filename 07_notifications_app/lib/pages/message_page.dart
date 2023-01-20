import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage ({super.key});

  static const routeName = "message_page"; 
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Producto page'),
      ),
      body: Center(
        child: Text( data?.toString() ?? "f"),
      ),
    );
  }
}