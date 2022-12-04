import 'dart:io';

import 'package:qr_scanner_flutter/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    if (_database != null) return _database!;
  }

  Future<Database> initDB() async {
    //crear path de donde se almacenara la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);
    //crar base de datos
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE Scans (
          id INTEGER PRIMARY KEY,
          type TEXT,
          value TEXT
        )
        ''');
      },
    );
  }

  Future<int?> insertScan(ScanModel scanModel) async{
    final db = await database;
    final result = await db?.insert('Scans', scanModel.toJson());
    print(result);
    return result;
  }

  Future<ScanModel?> getScanById(int id)async{
    final db = await database;
    final res = await db?.query('Scans', where:'id = ?', whereArgs: [id]);
    if(res != null){
      if (res.isNotEmpty){

        return ScanModel.fromJson(res.first);
      }
      else return null;
    }
    else return null;
  }

  Future<List<ScanModel>> getAllScans( )async{
    final db = await database;
    final res = await db?.query('Scans');
    if(res != null){
      if (res.isNotEmpty){
        return  res.map((e) => ScanModel.fromJson(e)).toList();
      }
      else return [];
    }
    else return [];
  }


  Future<int?> updateScan(ScanModel scan )async {
    final db = await database;
    final res = db?.update('Scans', scan.toJson(), where: 'id = ? ', whereArgs: [scan.id] );
    return res;
  }
  
  Future<int?> deletScan (int id) async{
    final db = await database;
    final res = await db?.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }

  Future<int?> deletAllsScan (int id) async{
    final db = await database;
    final res = await db?.delete('Scans');
    return res;
  }
}
