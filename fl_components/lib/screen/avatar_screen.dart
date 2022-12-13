import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  static const routeName = "avatar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stan Lee'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Text('SL')
            ),
          )
        ],
      ),
      body: const Center(
        child: CircleAvatar(
          radius: 90,
          backgroundImage:
              NetworkImage("https://i.blogs.es/85aa44/stan-lee/1366_2000.jpg"),
        )
      )
    );
  }
}
