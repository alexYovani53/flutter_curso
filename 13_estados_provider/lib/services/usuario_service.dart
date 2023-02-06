import 'package:flutter/material.dart';
import 'package:estados/models/usuario.dart';

class UsuarioService with ChangeNotifier { 

  Usuario? _usuario;

  Usuario? get usuario => _usuario;
  set usuario( Usuario? user ) {
    _usuario = user;
    notifyListeners();
  }
  
  bool get existeUsuario => (_usuario != null) ? true : false;

  void cambiarEdad( int edad ) {
    _usuario?.edad = edad;
    notifyListeners();
  }

  void removerUsuario(){
    _usuario = null;
    notifyListeners();
  }

  void agregarProfesion() {
    _usuario?.profesiones.add('Profesion ${ _usuario!.profesiones.length + 1 }');
    notifyListeners();
  }
}