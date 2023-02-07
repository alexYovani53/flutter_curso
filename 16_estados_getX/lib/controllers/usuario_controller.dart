
import 'package:get/get.dart';
import 'package:estados/models/usuario.dart';

class UsuarioController extends GetxController {

  RxBool existeUsuario = false.obs;
  Rx<Usuario> usuario = Usuario().obs;

  int get profesionesCount {
    return usuario.value.profesiones.length;
  }

  void deleteProfesion(){
    existeUsuario.value = false;
  }

  void cargarUsuario( Usuario pUsuario ) {
    existeUsuario.value = true;
    usuario.value = pUsuario;
  }

  void cambiarEdad( int edad ) {
    usuario.update((val) {
      val!.edad = edad;
    });
  }

  void agregarProfesion( String profesion ) {
    usuario.update((val) {
      val!.profesiones = [ ...val.profesiones, profesion ];
    });
  }

}