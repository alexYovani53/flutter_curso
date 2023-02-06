import 'package:chat/utils/app_config.dart';
import 'package:chat/utils/app_secure_storage.dart';
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

  SocketService();
  IO.Socket? socket;

  void connect() async {
    
    final token = await hasToken();

    socket = IO.io(Configs.socketUrl,
      IO.OptionBuilder()
      .setTimeout(3000)
      .setReconnectionDelay(5000)
      .enableForceNew()
      .setTransports(['websocket']) 
      .setExtraHeaders({
        'Authentication':token ?? ""
      }) // optional
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
      _serverStatuss = ServerStatus.Offline;
      notifyListeners();
    });
    socket!.onError((data) => print(data));
  }

  void lanzarMensaje(){
    socket!.emit("mensaje",{"Que tal"});
  }


  void disconnect(){
    _serverStatuss = ServerStatus.Offline;
    if(socket == null)return;
    socket!.disconnect();
  }

  @override
  void dispose() {
    socket!.disconnect();
    socket!.dispose();
    super.dispose();
  }

}