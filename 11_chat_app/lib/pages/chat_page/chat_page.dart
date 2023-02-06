import 'package:chat/models/usuario_model.dart';
import 'package:chat/pages/chat_page/chat_content.dart';
import 'package:chat/providers/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPageInit extends StatelessWidget {
  const ChatPageInit ();

  static const routeName = "chat_page"; 
  @override
  Widget build(BuildContext context) {

    final usuario = ModalRoute.of(context)!.settings.arguments as Usuario;

    return ChangeNotifierProvider(
      create: (context) => ChatService(user: usuario),
      builder: (context, child) => ChatPage(),
    );
  }
}