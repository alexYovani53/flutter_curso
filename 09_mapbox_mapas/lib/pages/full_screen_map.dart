import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class FullScreenMap extends StatelessWidget {
  const FullScreenMap ({super.key});

  static const routeName = "fullscreenmap"; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapboxMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(15.00, 15.000)
        ),
      ),
    );
  }
}
