
import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:qr_reader/provider/db_provider.dart';

class ScanListProvider extends ChangeNotifier{
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoSacan(String valor) async {

    final nuevoScan  = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);

    nuevoScan.id = id;
    if (tipoSeleccionado == nuevoScan.tipo) {
      scans.add(nuevoScan);
      notifyListeners();
    }

    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getTodosLosScans();
    this.scans = [...scans];
    notifyListeners();
  }

  cargarScansPorTipo(String tipo) async {
    final scans = await DBProvider.db.getScansPorTip(tipo);
    this.scans = [...scans];
    tipoSeleccionado = tipo;
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteallScans();
    scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async {
    await DBProvider.db.deleteScan(id);
    scans.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}