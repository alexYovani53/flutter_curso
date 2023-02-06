import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/usuarios_page.dart';
import 'package:chat/providers/auth_service.dart';
import 'package:chat/providers/socket_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  static const String route = "loading";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, AsyncSnapshot snapshot) {
          return Center(child: CircularProgressIndicator());
        },
      )
    );
  }

  Future checkLoginState(BuildContext context) async {
    final provider = Provider.of<AuthProvider>(context, listen: false);
    final state = await provider.hasTokenValidate();

    final page = state ? UsuariosPage() : LoginPage();
    if (state) {
      final socket = Provider.of<SocketService>(context, listen: false);
      socket.connect();
    } 
    Navigator.pushReplacement(
      context, 
      PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => page)
    );

  }
}
