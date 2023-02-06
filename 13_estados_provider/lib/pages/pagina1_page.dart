import 'package:estados/pages/pagina2_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';


class Pagina1Page extends StatelessWidget {

  static const routeName = "page1";

  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {

    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            icon: const Icon( Icons.exit_to_app ), 
            onPressed: () => usuarioService.removerUsuario()
          )
        ],
      ),
      body: usuarioService.existeUsuario
       ? InformacionUsuario( usuarioService.usuario! )
       : const Center( child: Text('No hay usuario seleccionado') ),

     floatingActionButton: FloatingActionButton(
       child: const Icon( Icons.accessibility_new ),
       onPressed: () => Navigator.pushNamed(context, Pagina2Page.routeName)
     ),
   );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario usuario;

  const InformacionUsuario( this.usuario, {super.key} );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text('General', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          const Divider(),

          ListTile( title: Text('Nombre: ${ usuario.nombre }') ),
          ListTile( title: Text('Edad: ${ usuario.edad }') ),

          const Text('Profesiones', style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ) ),
          const Divider(),

          ...usuario.profesiones.map(
            (profesion) => ListTile( title: Text( profesion ) )
          ).toList()
        ]
      )
    );
  }

}