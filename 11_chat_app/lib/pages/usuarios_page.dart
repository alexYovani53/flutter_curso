import 'package:chat/models/usuario_model.dart';
import 'package:chat/pages/login_page.dart';
import 'package:chat/providers/auth_service.dart';
import 'package:chat/utils/app_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
  
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(provider.usuario.nombre, style: TextStyle(color: Colors.black)),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () async {
            await logOut();
            Navigator.pushReplacementNamed(context,LoginPage.route);
          },
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
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(
          complete: Icon(Icons.check, color: Colors.blue[300]),
          waterDropColor: Colors.blue[400]!,
        ),
        controller: _refreshController,
        child: _listViewUsuarios(),
        onRefresh: _cargarUsuarios,
      )
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: usuarios.length,
      itemBuilder: (context, index) =>  _UsuarioListTitle(usuario: usuarios[index]),
      separatorBuilder: (context, index) => Divider(),
    );
  }

  void _cargarUsuarios() async {
    await Future.delayed(Duration(seconds: 4));
    _refreshController.refreshCompleted();
  }
}

class _UsuarioListTitle extends StatelessWidget {
  const _UsuarioListTitle({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  final Usuario usuario;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(usuario.nombre),
      subtitle: Text(usuario.email),
      leading: CircleAvatar(
        child: Text(usuario.nombre.substring(0,2)),
        backgroundColor: Colors.blue[100],
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: usuario.online ? Colors.green : Colors.red, 
          borderRadius: BorderRadius.circular(100)
        ),
      ),
    );
  }
}
