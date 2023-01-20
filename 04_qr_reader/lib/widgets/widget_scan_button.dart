import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/provider/scan_list_provider.dart';
import 'package:qr_reader/utils/app_launcher.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        // final scanRes = await FlutterBarcodeScanner.scanBarcode("#3d8bef", "Cancelar", false, ScanMode.QR);
        
        const barcodeScanRes = "geo:14.647971,-90.735673";
        // const barcodeScanRes = "https://www.deepl.com/es/translator";
        if (barcodeScanRes == '-1') return;

        final ScanListProvider provider = Provider.of<ScanListProvider>(context, listen: false);
        final nuevoScan = await provider.nuevoSacan(barcodeScanRes);
        launchUrl(nuevoScan, context);
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}