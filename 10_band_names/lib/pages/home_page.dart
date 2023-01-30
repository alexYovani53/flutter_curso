import 'dart:io';

import 'package:band_names/models/band.dart';
import 'package:band_names/services/socket_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage ({super.key});

  static const routeName = "home"; 

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<Band> bands = [
    // Band(id: "1", name: "Metallica", votes: 5),
    // Band(id: "2", name: "Metallica", votes: 3),
    // Band(id: "3", name: "Metallica", votes: 5),
    // Band(id: "4", name: "Metallica", votes: 1),
    // Band(id: "5", name: "Metallica", votes: 6),
  ];

  @override
  void initState() {
    super.initState();

    final socketService = Provider.of<SocketService>(context,listen: false);
    socketService.socket!.on('active-bands', _handleActiveBands);
  }

  _handleActiveBands(dynamic payload){
    bands = (payload as List).map((band) => Band.fromMap(band)).toList();
    setState(() {});
  }


  @override
  void dispose() {

    final socketService = Provider.of<SocketService>(context,listen: false);
    socketService.socket!.off('active-bands');
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    
    final socketService = Provider.of<SocketService>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('BandNames',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: socketService.serverStatus == ServerStatus.Online 
              ? const Icon(Icons.online_prediction, color: Colors.green)
              : const Icon(Icons.offline_bolt, color: Colors.red)
          )
        ],
      ),
      body: Column(
        children: [
          if(bands.isNotEmpty) _mostrarGrafica(),
          Expanded(
            child: ListView.builder(
              itemCount: bands.length,
              itemBuilder: (context, i) => _bandTile(bands[i])
            ),
          )
        ],
      ), 
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: addNewBand,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _bandTile(Band band) {
    final socketService = Provider.of<SocketService>(context, listen: false);
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      background: Container(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        color: Colors.blue[100],
        child: const Align(
          alignment: Alignment.centerLeft,
          child: Text('Eliminar banda', style: TextStyle(color: Colors.white),),
        )
      ),
      onDismissed: (_) => socketService.socket!.emit('delete-band', {'id': band.id}),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(band.name.substring(0,2)),
        ), 
        title: Text(band.name),
        trailing: Text('${band.votes}', style: const TextStyle(fontSize: 20)),
        onTap: () => socketService.socket!.emit('vote-band', {'id': band.id}),
      )
    );
  }

  addNewBand(){
    final textController = TextEditingController();
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
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
          ]
        )
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
          ]
        )
      );
    }
  }

  void addBandToList(String newBand){
    if(newBand.isNotEmpty) {
      final provider = Provider.of<SocketService>(context,listen: false);
      provider.socket!.emit('add-band', { 'name': newBand});
    }
    Navigator.pop(context);
  }

  Widget _mostrarGrafica(){
    
    Map<String, double> dataMap = {};
    for (var element in bands) {
      dataMap.putIfAbsent(element.name, () => element.votes.toDouble());
    }
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: PieChart(dataMap: dataMap),
    );
  }
}