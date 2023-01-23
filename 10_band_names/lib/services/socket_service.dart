import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

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

  void _initConfig(){
     // Dart client
     // Ip del computador donde esta ejecutando el servidor y emulado el app. 
    Socket socket = io('http://172.18.240.1:3000/',    
    OptionBuilder()
      .setTransports(['websocket']) // for Flutter or Dart VM
      .build()
    );
    socket.onError((data) => print(data));
    socket.onConnect((_) {
      print('connect');
      _serverStatuss = ServerStatus.Online;
      notifyListeners();
    });
    socket.onDisconnect((_) {
      print('connect');
      _serverStatuss = ServerStatus.Offline;
      notifyListeners();
    });
  }

}