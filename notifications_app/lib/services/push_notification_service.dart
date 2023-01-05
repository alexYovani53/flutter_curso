import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService{
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStream = StreamController.broadcast();
  static Stream<String> get messagesStream => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    print(message.data);
    _messageStream.add(
      message.data["producto"] ?? message.notification?.title?? message.notification?.title?? ""
    );
  }
  static  void _onMessageHandler(RemoteMessage message)  {
    print("_onMessageHandler handler ${message.messageId}");
    print(message.data);
    _messageStream.add(
      message.data["producto"] ?? message.notification?.title?? message.notification?.title?? ""
    );
  }
  static Future _onMessageOpenApp(RemoteMessage message) async {
    print(message.data);
    print("_onMessageOpenApp handler ${message.messageId}");
    _messageStream.add(
      message.data["producto"] ?? message.notification?.title?? message.notification?.title?? ""
    );
  }

  static Future initializeApp() async {
    // pushh notifications
    
    await Firebase.initializeApp();
    token = await messaging.getToken();

    print(token);

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );


    //Handlers
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    // Local notificatios
  }

  static closeStream(){
    _messageStream.close();
  }
}
