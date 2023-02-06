import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:estados/services/usuario_service.dart';


class Pagina2Page extends StatelessWidget {
  static const routeName = "page2";

  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {

    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
          ? Text('Nombre: ${ usuarioService.usuario!.nombre }')
          : const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final newUser = Usuario(
                  nombre: 'Alex Yovani Jerónimo Tomás', 
                  edad: 24,
                  profesiones: ['Apps developer']
                );
                usuarioService.usuario = newUser;
              },
              child: const Text('Establecer Usuario', style: TextStyle( color: Colors.white ) )
            ),

            MaterialButton(
              color: Colors.blue,
              onPressed: () => usuarioService.cambiarEdad(45),
              child: const Text('Cambiar Edad', style: TextStyle( color: Colors.white ) )
            ),

            MaterialButton(
              color: Colors.blue,
              onPressed: () => usuarioService.agregarProfesion(),
              child: const Text('Añadir Profesion', style: TextStyle( color: Colors.white ) )
            ),
          ]
        )
     )
   );
  }
}