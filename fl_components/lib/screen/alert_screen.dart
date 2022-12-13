import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  static const String routeName = "alertas";

  void displayDialogIOs(BuildContext context) {
    showCupertinoDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: const Text('Titulo'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [Text('Este es el contenido de la alerta')],
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancelar'))
              ],
            ));
  }

  void displayDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              elevation: 5,
              title: const Text('Titulo'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [Text('Este es el contenido de la alerta')],
              ),
              buttonPadding: EdgeInsets.zero,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancelar')),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: const Icon(Icons.close),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                  onPressed: () => displayDialogIOs(context),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text('Mostrar alerta Ios'),
                  )),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () => displayDialog(context),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    child: Text('Mostrar alerta Android'),
                  )),
            ],
          ),
        ));
  }
}
