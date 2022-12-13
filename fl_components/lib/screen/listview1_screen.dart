import 'package:flutter/material.dart';

class ListViewTipo1Screen extends StatelessWidget {
  ListViewTipo1Screen({Key? key}) : super(key: key);

  static const routName = "ListViewTipo1";
  final games = ["Mario kart", "Clash royal", "Bubble switch 2"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista tipo 1")),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(title: Text(games[index])),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: games.length),
    );
  }
}
