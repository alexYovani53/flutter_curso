import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_reader/models/scan_model.dart';

class MapaPage extends StatefulWidget {
  const MapaPage ({super.key});

  static const routeName = "mapa_page"; 

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  late CameraPosition initial;
  MapType type = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;
    initial = CameraPosition(target: scan.getLatLng(), zoom: 19.151926040649414, tilt: 50);

    Set<Marker> markers = <Marker>{};
    markers.add(
      Marker(markerId: const MarkerId('geo-location'), position: scan.getLatLng())
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mapa"),
        actions: [
          IconButton(onPressed: goToInitial, icon: const Icon(Icons.location_disabled))
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        mapType: type,
        initialCameraPosition: initial,
        markers: markers,
        onMapCreated: (controller) => _controller.complete(controller),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.layers),
        onPressed: () {
          type = type == MapType.normal ? MapType.satellite : MapType.normal;
          setState(() {});
        },
      ),
    );
  }

  void goToInitial() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(initial));       
  }
}