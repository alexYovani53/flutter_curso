import 'package:chat/pages/chat_page/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:chat/models/usuario_model.dart';
import 'package:chat/pages/login_page.dart';
import 'package:chat/providers/auth_service.dart';
import 'package:chat/providers/socket_provider.dart';
import 'package:chat/providers/usuarios_service.dart';
import 'package:chat/utils/app_secure_storage.dart';

class UsuariosPage extends StatefulWidget {
  static const String route = "usuarios";

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  
  List<Usuario> usuarios = <Usuario>[];
  
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    _pedirUsuarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    final socket  = Provider.of<SocketService>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(provider.usuario.nombre, style: TextStyle(color: Colors.black)),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () async {
            await logOut();
            socket.disconnect();
            Navigator.pushReplacementNamed(context,LoginPage.route);
          },
          icon: Icon(Icons.exit_to_app, color: Colors.black)
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: socket.serverStatus == ServerStatus.Online 
              ? Icon(Icons.check_circle, color: Colors.blue[300])
              : Icon(Icons.offline_bolt, color: Colors.red[300]),
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
        child: UsuariosList(usuarios: usuarios),
        onRefresh: _cargarUsuarios,
      )
    );
  }



  void _cargarUsuarios() async {
    _pedirUsuarios();    
    setState(() {});
    _refreshController.refreshCompleted();
  }

  void _pedirUsuarios() async{
    final result = await UsuariosService().getUsuarios();
    this.usuarios = result;
  }
}


class UsuariosList extends StatelessWidget {
  final List<Usuario> usuarios;
  const UsuariosList({
    Key? key,
    required this.usuarios,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: usuarios.length,
      itemBuilder: (context, index) =>  _UsuarioListTitle(usuario: usuarios[index]),
      separatorBuilder: (context, index) => Divider(),
    );
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
      onTap: () {
        Navigator.pushNamed(context, ChatPageInit.routeName, arguments: this.usuario);
      },
    );
  }
}
