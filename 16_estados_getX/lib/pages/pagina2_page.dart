import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  static const routeName = "/page2";

  @override
  Widget build(BuildContext context) {

    print(Get.arguments);
    final usuarioCtrl = Get.find<UsuarioController>();

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
                usuarioCtrl.cargarUsuario( Usuario(nombre: 'Yovani', edad: 35 ) );
                Get.snackbar(
                  'Usuario establecido', 
                  'Alex es el nombre del usuario',
                  backgroundColor: Colors.white,
                  snackPosition: SnackPosition.BOTTOM,
                  boxShadows: [
                    const BoxShadow(
                      color: Colors.black38,
                      blurRadius: 10
                    )
                  ]
                );
              },
              child: const Text('Establecer Usuario', style: TextStyle( color: Colors.white ) )
            ),

            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.cambiarEdad(25);
              },
              child: const Text('Cambiar Edad', style: TextStyle( color: Colors.white ) )
            ),

            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                usuarioCtrl.agregarProfesion( 'Profesión #${ usuarioCtrl.profesionesCount + 1 }' );
              },
              child: const Text('Añadir Profesion', style: TextStyle( color: Colors.white ) )
            ),

            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Get.changeTheme( Get.isDarkMode ? ThemeData.light() : ThemeData.dark() );
              },
              child: const Text('Cambair tema', style: TextStyle( color: Colors.white ) )
            ),

          ],
        )
     ),
   );
  }
}