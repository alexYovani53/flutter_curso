import 'dart:io';

import 'package:band_names/models/band.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage ({super.key});

  static const routeName = "home"; 

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<Band> bands = [
    Band(id: "1", name: "Metallica", votes: 5),
    Band(id: "2", name: "Metallica", votes: 3),
    Band(id: "3", name: "Metallica", votes: 5),
    Band(id: "4", name: "Metallica", votes: 1),
    Band(id: "5", name: "Metallica", votes: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('BandNames',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i) => _bandTile(bands[i])
      ), 
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: addNewBand,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _bandTile(Band band) => Dismissible(
    key: Key(band.id),
    direction: DismissDirection.startToEnd,
    background: Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      color: Colors.blue[100],
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text('Eliminar banda', style: TextStyle(color: Colors.white),),
          ),
    ),
    onDismissed: (direction) {
      
    },
    child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(band.name.substring(0,2)),
        ), 
        title: Text(band.name),
        trailing: Text('${band.votes}', style: const TextStyle(fontSize: 20)),
        onTap: () {
          
        },
      ),
  );

  addNewBand(){
    final textController = TextEditingController();
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Nombre de Banda nueva: '),
          content: TextField(
            controller: textController,
          ),
          actions: [
            MaterialButton(
              textColor: Colors.blue,
              child: const Text('Guardar'),
              onPressed: () => addBandToList(textController.text),
            )
          ],
        ), 
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
          title: const Text('Nombre de Banda nueva: '),
          content: CupertinoTextField(
            controller: textController,
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text('Guardar'),
              onPressed: () => addBandToList(textController.text),
            )
          ],
        ), 
      );
    }
  }

  void addBandToList(String name){
    if(name.isNotEmpty) {
      bands.add(Band(id: "", name: name, votes: 5));
      setState(() {});
    }

    Navigator.pop(context);
  }
  
}