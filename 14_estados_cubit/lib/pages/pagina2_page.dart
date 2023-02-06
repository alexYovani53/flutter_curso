import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados/bloc/usuario/usuario_cubit.dart';


class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  static const routeName = "pagina2";

  @override
  Widget build(BuildContext context) {

    final usuarioCubit = context.read<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
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
                  profesiones: [
                    'Apps developer',
                    'Ingeniero en sistemas'
                  ]
                );

                usuarioCubit.seleccionarUsuario(newUser);
              },
              child: const Text('Establecer Usuario', style: TextStyle( color: Colors.white ) )
            ),

            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.cambiarEdad(30);
              },
              child: const Text('Cambiar Edad', style: TextStyle( color: Colors.white ) )
            ),

            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioCubit.agregarProfesion();
              },
              child: const Text('Añadir Profesion', style: TextStyle( color: Colors.white ) )
            ),
          ]
        )
      )
   );
  }
}