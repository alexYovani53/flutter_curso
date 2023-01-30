import 'package:chat/models/usuario_model.dart';
import 'package:flutter/material.dart';

class UsuariosPage extends StatefulWidget {
  static const String route = "usuarios";

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  
  final usuarios = [
    Usuario(online: true, email: "alex@gmail.com", nombre: "Alex", uid: "13fd"),
    Usuario(online: true, email: "alex2@gmail.com", nombre: "Alex2", uid: "13fd"),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi nombre', style: TextStyle(color: Colors.black)),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.exit_to_app, color: Colors.black)
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            // child: Icon(Icons.check_circle, color: Colors.blue[300]),
            child: Icon(Icons.offline_bolt, color: Colors.red[300]),
          )
        ],
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: usuarios.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${usuarios[index].nombre}'),
            leading: CircleAvatar(
              child: Text('${usuarios[index].nombre.substring(0,2)}'),
            ),
            trailing: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: usuarios[index].online ? Colors.green : Colors.red, 
                borderRadius: BorderRadius.circular(100)
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
      )
    );
  }
}
