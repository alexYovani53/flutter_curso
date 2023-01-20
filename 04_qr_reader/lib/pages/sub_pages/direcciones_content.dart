import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/provider/scan_list_provider.dart';
import 'package:qr_reader/widgets/widget_item_history.dart';

class DireccionesContent extends StatelessWidget {
  const DireccionesContent({super.key});

 @override
  Widget build(BuildContext context) {
    final ScanListProvider provider = Provider.of<ScanListProvider>(context);
    return ListView.builder(
      itemCount: provider.scans.length,
      itemBuilder: (context, index) => ItemHistory(scan: provider.scans[index], map: false),
    );
  }

}