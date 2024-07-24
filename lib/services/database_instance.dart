import 'dart:io';

import 'package:flutter_x_mobpro/models/note_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseInstance {
  final String dbName = "catatan.db";
  final int dbVersion = 1;

  final String tableName = "note";
  // Column
  final String id = "id";
  final String judul = "judul";
  final String isi = "isi";
  final String updatedAt = "updated_at";

  Database? _database;
  Future<Database> database() async {
    if (_database != null) return _database!;
    _database = await databaseInit();
    return _database!;
  }

  Future<Database> databaseInit() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, dbName);
    return openDatabase(
      path,
      version: dbVersion,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE $tableName ($id INTEGER PRIMARY KEY, $judul TEXT, $isi TEXT, $updatedAt TEXT )');
      },
    );
  }

  Future<List<NoteModel>> getAll() async {
    final db = await database();
    // final query = await db.query(tableName);
    final query = await db.rawQuery('SELECT * FROM $tableName ORDER BY $judul ASC');
    List<NoteModel> catatan = query.map((e) => NoteModel.fromJson(e)).toList();
    return catatan;
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final db = await database();
    final query = await db.insert(tableName, row);
    return query;
  }

  Future<int> update(int paramId, Map<String, dynamic> row) async {
    final db = await database();
    final query =
        await db.update(tableName, row, where: '$id = ?', whereArgs: [paramId]);
    return query;
  }

  Future<int> delete(int paramId) async {
    final db = await database();
    final query =
        await db.delete(tableName, where: '$id = ?', whereArgs: [paramId]);
    return query;
  }
}
