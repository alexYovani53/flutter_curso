import 'package:chat/pages/register_page.dart';
import 'package:chat/pages/usuarios_page.dart';
import 'package:chat/providers/auth_service.dart';
import 'package:chat/providers/socket_provider.dart';
import 'package:chat/widgets/boton_azul.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:chat/widgets/labels.dart';
import 'package:chat/widgets/logo.dart';
import 'package:chat/widgets/custom_input.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  static const String route = "login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Logo(titulo: 'Messenger'),
                _Form(),
                Labels(
                  ruta: RegisterPage.route,
                  titulo: '¿No tienes cuenta?',
                  subTitulo: 'Crea una ahora!',
                ),
                Text(
                  'Términos y condiciones de uso',
                  style: TextStyle(fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    final socket   = Provider.of<SocketService>(context);
    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            textController: passCtrl,
            isPassword: true,
          ),
          provider.autenticando 
            ? Center(child: CupertinoActivityIndicator())
            : BotonAzul(
            text: 'Ingrese',
            onPressed: () async {
              FocusScope.of(context).unfocus();
              provider.autenticando = true;
              final res = await provider.login(emailCtrl.text, passCtrl.text);
              if (res.token != null) {
                socket.connect();
                Navigator.pushNamed(context, UsuariosPage.route);
              }else{
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(res.msg!))
                );
              }
              provider.autenticando = false;
            },
          )
        ],
      ),
    );
  }
}
