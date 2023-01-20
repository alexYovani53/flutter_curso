import 'package:flutter/cupertino.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:qr_reader/pages/mapa_page.dart';
import 'package:url_launcher/url_launcher_string.dart';

launchUrl(ScanModel scan, BuildContext context) async {
  if (scan.tipo != 'http') {
    Navigator.pushNamed(context, MapaPage.routeName, arguments: scan);
    return;
  }
  if (await canLaunchUrlString(scan.valor)) {
    await launchUrlString(scan.valor);
  }else {
    //throw 'Culd not launch ${scan.valor}';
  }
}