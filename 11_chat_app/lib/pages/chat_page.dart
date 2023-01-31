import 'dart:io';

import 'package:chat/widgets/chat_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  static const String route = "chat";

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatMessage> messages = [
    ChatMessage(message: "Hola mundo", uid: "123"),
    ChatMessage(message: "Hola mundo", uid: "123d"),
    ChatMessage(message: "Hola mundo dfsdf sdfa sdf", uid: "123"),
    ChatMessage(message: "Hola mundo dfsdf sdfa sdf  fdasfasd asdf as asdf ", uid: "123"),
    ChatMessage(message: "Hola mundo  afasdfa sdfasdfasdf adf adsf ", uid: "123d"),
    ChatMessage(message: "Hola mundo", uid: "123"),
    ChatMessage(message: "Hola mundo", uid: "123d"),
    ChatMessage(message: "Hola mundo", uid: "123"),
  ];

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
                itemBuilder: (context, index) => messages[index]
              ),
            ), 

            _InputChat(sendMessage: setMesage),
          ],
        ),
      )
    );
  }

  setMesage(ChatMessage message){
    this.messages.insert(0,message);
    setState(() {});
  }
}

class _InputChat extends StatefulWidget {
  final Function(ChatMessage) sendMessage;
  _InputChat({
    Key? key, required this.sendMessage,
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40)
                ),
                child: TextFormField(
                  enableSuggestions: true,
                  controller: _textController,
                  onFieldSubmitted: _handleSubmit,
                  onChanged: (value) {
                   setState(() {
                      if (this._textController.text.trim().length > 0) {
                        _estaEscribiendo = true;
                      } else {
                        _estaEscribiendo = false;
                      }
                    });
                  },
                  decoration: InputDecoration.collapsed(
                    hintText: 'Enviar mensaje', 
                    fillColor: Colors.white
                  ),
                  focusNode: _focusNode,
                ),
              ),
            ),

            //Boton de enviar
            if(_estaEscribiendo) Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Platform.isIOS 
                ? CupertinoButton(
                    child: Text('Enviar'),
                    onPressed: _estaEscribiendo 
                        ? () => _handleSubmit(_textController.text)
                        : null
                  )
                : Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconTheme(
                    data: IconThemeData(color: Colors.blue[300]),
                    child: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: Icon(Icons.send),
                      onPressed: _estaEscribiendo 
                        ? () => _handleSubmit(_textController.text)
                        : null
                    ),
                  ),
                )
            )

          ],
        ),
      ),
    );
  }

  _handleSubmit(String text){
    debugPrint(text);
    _textController.clear();
    _focusNode.requestFocus();

    final newMessage = ChatMessage(message: text, uid: "123");
    widget.sendMessage(newMessage);
    setState(() {
      _estaEscribiendo = false;
    });
  }
}

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar() ;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Column(
        children: [
          CircleAvatar(
            child: Text("AY", style: TextStyle(fontSize: 12)),
            backgroundColor: Colors.blue[200],
            maxRadius: 14,
          ), 
          SizedBox(height: 3), 
          Text('Yovani ', style: TextStyle(color: Colors.black87, fontSize: 10))
        ]
      )
    );
  }
  
  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
