import 'package:flutter/material.dart';

import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';


class Pagina2Page extends StatelessWidget {
  static const routeName = "pagina2";

  const Pagina2Page({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot){
            return snapshot.hasData
              ? Text('Nombre: ${ snapshot.data!.nombre }')
              : Text('Nombre: ${ usuarioService.usuario?.nombre ?? "" }');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            MaterialButton(
              color: Colors.blue,
              onPressed: () {

                final nuevoUsuario = Usuario( nombre: 'Fernando', edad: 35 , profesiones: ["Carpintero", "Ingeniero"]);

                usuarioService.cargarUsuario(nuevoUsuario);
              },
              child: const Text('Establecer Usuario', style: TextStyle( color: Colors.white ) )
            ),

            if(usuarioService.existeUsuario) ... [
              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  usuarioService.cambiarEdad(30);
                },
                child: const Text('Cambiar Edad', style: TextStyle( color: Colors.white ) )
              ),

              MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  usuarioService.agregarProfesion("Nueva profesion");
                },
                child: const Text('Añadir Profesion', style: TextStyle( color: Colors.white ) )
              ),
            ]
          ],
        )
     ),
   );
  }
}