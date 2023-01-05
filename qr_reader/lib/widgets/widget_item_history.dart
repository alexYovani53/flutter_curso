
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:qr_reader/provider/scan_list_provider.dart';
import 'package:qr_reader/utils/app_color.dart';
import 'package:qr_reader/utils/app_launcher.dart';

class ItemHistory extends StatelessWidget {
  final ScanModel scan;
  final bool map;
  const ItemHistory({super.key, required this.scan, required this.map});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        Provider.of<ScanListProvider>(context, listen: false).borrarScanPorId(scan.id!);
      },
      child: ListTile(
        leading: Icon(map ?  Icons.map : Icons.home, color: AppColor.shared.primary),
        title: Text(scan.valor),
        subtitle: Text(scan.id.toString()),
        trailing: const Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
        onTap: () => launchUrl(scan, context),
      ),
    );
  }
}