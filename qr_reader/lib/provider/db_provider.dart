import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();
  static Database? _database;
  static final DBProvider db = DBProvider._();

  Future<Database> get database async {
    if(_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }
  
  Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "scansdb.db");
    print(path);

    return await openDatabase(
      path,
      version: 1, 
      onCreate: onCreate,
    );
  }

  FutureOr<void> onCreate(Database db, version) async {
    await db.execute('''
      CREATE TABLE Scans(
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        tipo TEXT,
        valor TEXT
      )
    ''');   
  }

  Future<int> nuevoScanRaw(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.rawInsert('''
      INSERT INTO Scans(tipo, valor) 
        VALUES (${nuevoScan.tipo},${nuevoScan.valor});
    ''');
    return res;
  }

  Future<int> nuevoScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.insert("Scans", nuevoScan.toMap());
    return res;
  }

  Future<ScanModel?> getScanById(int i) async {
    final db = await database;
    final res = await db.query("Scans", where: "id = ?", whereArgs: [i]);
    return res.isNotEmpty
      ? ScanModel.fromMap(res.first)
      : null;
  }

  Future<List<ScanModel>> getTodosLosScans() async {
    final db = await database;
    final res = await db.query("Scans");
    return res.isNotEmpty
      ? res.map((e) => ScanModel.fromMap(e)).toList()
      : [];
  }
    
  Future<List<ScanModel>> getScansPorTip(String tipo) async {
    final db = await database;
    final res = await db.rawQuery('''
      SELECT * FROM Scans WHERE tipo = '$tipo' 
    ''');
    return res.isNotEmpty
      ? res.map((e) => ScanModel.fromMap(e)).toList()
      : [];
  }

  Future<int> updateScan(ScanModel nuevoScan) async {
    final db  = await database;
    final res = await db.update("Scans", nuevoScan.toMap(), where: "id = ?", whereArgs: [nuevoScan.id]);
    return res;
  }

  Future<int> deleteScan(int id) async {
    final db  = await database;
    final res = await db.delete("Scans", where: "id = ?", whereArgs: [id]);
    return res;
  }

  Future<int> deleteallScans() async {
    final db  = await database;
    final res = await db.delete("Scans");
    return res;
  }
}