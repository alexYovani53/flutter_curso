import 'dart:async';

import 'package:estados/models/usuario.dart';

class _UsuarioService {

  Usuario? _usuario;

  final StreamController<Usuario> _usuarioStreamController = StreamController<Usuario>.broadcast();
  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  Usuario? get usuario => _usuario;
  bool get existeUsuario => ( _usuario != null ) ? true : false;

  void cargarUsuario( Usuario user ) {
    _usuario = user;
    _usuarioStreamController.add(user);
  }

  void cambiarEdad( int edad ) {
    _usuario!.edad = edad;
    _usuarioStreamController.add( _usuario! );
  }

  void agregarProfesion( String profesion ) {
    _usuario!.profesiones.add(profesion);
    _usuarioStreamController.add( _usuario! );
  }

  dispose() => _usuarioStreamController.close();
}

final usuarioService = _UsuarioService();