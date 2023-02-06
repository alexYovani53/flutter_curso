import 'dart:io';

import 'package:chat/providers/auth_service.dart';
import 'package:chat/providers/chat_service.dart';
import 'package:chat/providers/socket_provider.dart';
import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  List<ChatMessage> messages = [];
  late ChatService chatprovider;
  late SocketService socketService;
  late AuthProvider authProvider;

  @override
  void initState() {
    super.initState();
    chatprovider = Provider.of<ChatService>(context, listen: false);
    socketService = Provider.of<SocketService>(context, listen: false);
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    
    _cargarHistorial();

    socketService.socket!.on("mensaje-recibido", _escucharMensaje);

  }

  void _cargarHistorial() async {
    final mensajes = await chatprovider.getMensajesChat();
    final history = mensajes.map((e) =>ChatMessage(
      message: e.mensaje,
      uid: e.de,
      controller: AnimationController(vsync: this, duration: Duration(milliseconds: 0))..forward()
    ));

    setState(() {
      messages.insertAll(0, history);
    });
  }

  _escucharMensaje(payload) {
    final msg = ChatMessage(
      message: payload['mensaje'],
      uid: payload['de'],
      controller: AnimationController(vsync: this, duration: Duration(milliseconds: 100))
    );
    
    setState(() => this.messages.insert(0, msg));
    
    msg.controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _CustomAppBar(),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) => messages[index]),
            ),
            _InputChat(sendMessage: sendMessage),
          ],
        ),
      )
    );
  }

  sendMessage(String message) {
    final msg = ChatMessage(
      message: message,
      uid: authProvider.usuario.uid,
      controller: AnimationController(
        vsync: this, duration: Duration(milliseconds: 100)
      )
    );
    this.messages.insert(0, msg);
    msg.controller.forward();
    setState(() {});

    this.socketService.socket!.emit("mensaje-personal", {
      'de': authProvider.usuario.uid, 
      'para': chatprovider.user.uid, 
      'mensaje': message
    });
  }

  @override
  void dispose() {
    for (var message in messages) {
      message.controller.dispose();
    }

    this.socketService.socket!.off('mensaje-recibido');
    super.dispose();
  }
}

class _InputChat extends StatefulWidget {
  final Function(String) sendMessage;
  _InputChat({
    Key? key,
    required this.sendMessage,
  }) : super(key: key);

  @override
  State<_InputChat> createState() => _InputChatState();
}

class _InputChatState extends State<_InputChat> {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  bool _estaEscribiendo = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Flexible(
              child: Container(
                alignment: Alignment.center,
                height: 50,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.only(left: 25, right: 25),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(40)),
                child: TextFormField(
                  enableSuggestions: true,
                  controller: _textController,
                  onFieldSubmitted: _estaEscribiendo ? _handleSubmit : null,
                  onChanged: (value) {
                    setState(() {
                      if (this._textController.text.trim().length > 0) {
                        _estaEscribiendo = true;
                      } else {
                        _estaEscribiendo = false;
                      }
                    });
                  },
                  decoration: InputDecoration.collapsed(hintText: 'Enviar mensaje', fillColor: Colors.white),
                  focusNode: _focusNode,
                ),
              ),
            ),

            //Boton de enviar
            if (_estaEscribiendo)
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Platform.isIOS
                      ? CupertinoButton(
                          child: Text('Enviar'),
                          onPressed: _estaEscribiendo ? () => _handleSubmit(_textController.text) : null)
                      : Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: IconTheme(
                            data: IconThemeData(color: Colors.blue[300]),
                            child: IconButton(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                icon: Icon(Icons.send),
                                onPressed: _estaEscribiendo ? () => _handleSubmit(_textController.text) : null),
                          ),
                        ))
          ],
        ),
      ),
    );
  }

  _handleSubmit(String text) {
    debugPrint(text);
    _textController.clear();
    _focusNode.requestFocus();

    widget.sendMessage(text);
    setState(() {
      _estaEscribiendo = false;
    });
  }
}

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    final chatService = Provider.of<ChatService>(context);
    return AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Column(children: [
          CircleAvatar(
            child: Text(chatService.user.getIniciales(), style: TextStyle(fontSize: 12)),
            backgroundColor: Colors.blue[200],
            maxRadius: 14,
          ),
          SizedBox(height: 3),
          Text(
            chatService.user.email, style: TextStyle(color: Colors.black87, fontSize: 10
          ))
        ]));
  }

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
