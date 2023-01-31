import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final String uid;
  const ChatMessage({required this.message, required this.uid});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.uid == '123'
        ? _myMessage()
        : _notMyMessage()
    );
  }
  
  Widget _myMessage() => Align(
    alignment: Alignment.centerRight,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 5, right: 10, left: 50),
      child: Text(this.message, style: TextStyle(color: Colors.white),),
      decoration: BoxDecoration(
        color: Color(0xff4d9ef6), 
        borderRadius: BorderRadius.circular(100)
      ),
    )
  );
  
  _notMyMessage() => Align(
    alignment: Alignment.centerLeft,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 5, right: 50, left: 10),
      child: Text(this.message, style: TextStyle(color: Colors.white),),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 3, 105, 65), 
        borderRadius: BorderRadius.circular(100)
      ),
    )
  );
}