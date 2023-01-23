import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  Online, 
  Offline, 
  Connecting
}
class SocketService with ChangeNotifier {

  ServerStatus _serverStatuss = ServerStatus.Connecting;
  ServerStatus get serverStatus  => _serverStatuss;

  SocketService(){
    _initConfig();
  }

  IO.Socket? socket;

  void _initConfig(){
     // Dart client
     // Ip del computador donde esta ejecutando el servidor y emulado el app. 

    socket = IO.io('http://127.0.0.1:3000/',
      IO.OptionBuilder()
      .setTimeout(3000)
      .setReconnectionDelay(5000)
      .setTransports(['websocket']) 
      .setExtraHeaders({'foo': 'bar'}) // optional
      .build()
    );

    socket!.onConnect((_) {
      _serverStatuss = ServerStatus.Online;
      notifyListeners();
    });

    socket!.onConnectError((er) {
      print('ConnectError $er');
      _serverStatuss = ServerStatus.Offline;
      notifyListeners();
    });

    socket!.onDisconnect((_) {
      print('disconnect');
      _serverStatuss = ServerStatus.Offline;
      notifyListeners();
    });
    socket!.onError((data) => print(data));
  }

  void lanzarMensaje(){
    socket!.emit("mensaje",{"Que tal"});
  }

  @override
  void dispose() {
    socket!.disconnect();
    socket!.dispose();
    super.dispose();
  }

}