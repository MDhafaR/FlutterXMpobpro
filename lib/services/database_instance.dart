import 'dart:io';

import 'package:flutter_x_mobpro/models/mahasiswa.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseInstance {
  String dbName = "catatan_challenge.db";
  int dbVersion = 1;

  String tableName = "catatan";
  // column
  String id = "id";
  String nama = "nama";
  String nim = "nim";
  String kelas = "kelas";

  Database? _database;
  Future<Database?> database() async {
    if (_database != null) return _database;
    _database = await initDatabase();
    return _database;
  }

  Future<Database> initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, dbName);
    return openDatabase(
      path,
      version: dbVersion,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE $tableName ($id INTEGER PRIMARY KEY, $nama TEXT, $nim TEXT, $kelas TEXT)');
      },
    );
  }

  Future<List<Mahasiswa>> getAll() async {
    Database? db = await database();
    final dataMhs = await db!.query(tableName);
    return dataMhs.map((e) => Mahasiswa.fromJson(e)).toList();
  }

  Future<int> insert(Map<String, dynamic> value) async {
    Database? db = await database();
    final query = await db!.insert(tableName, value);
    return query;
  }

  Future<int> update(Map<String, dynamic> value, int idParam) async {
    Database? db = await database();
    final query = await db!
        .update(tableName, value, where: "$id = ?", whereArgs: [idParam]);
    return query;
  }

  Future<int> delete(int idParam) async {
    Database? db = await database();
    final query =
        await db!.delete(tableName, where: "$id = ?", whereArgs: [idParam]);
    return query;
  }
}
