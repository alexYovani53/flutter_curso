import 'package:flutter/material.dart';
import 'package:productos_app/pages/pages.dart';
import 'package:productos_app/services/auth_services.dart';
import 'package:provider/provider.dart';

class CheckAuthScreen extends StatelessWidget {
  const CheckAuthScreen ({super.key});

  static const routeName = "check"; 
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future:  authService.readToken(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Text('Espere');
            }

            navigator(context, snapshot.data == '');
            return Container();
          },
        ),
      ),
    );
  }

  void navigator(BuildContext context, bool toLogin) {
    Future.microtask(() {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => toLogin 
            ? const LoginPage() 
            : const HomePage(),
          transitionDuration: Duration.zero
        )
      );
    });
  }
}