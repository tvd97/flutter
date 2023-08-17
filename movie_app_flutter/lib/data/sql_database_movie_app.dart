import 'package:movie_app_flutter/data/favorite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;
  static const String table = "favorite";
  static const String backdropPath = "backdropPath";
  static const String id = "id";
  static const String originalTitle = "originalTitle";
  static const String popularity = "popularity";
  static const String posterPath = "posterPath";
  static const String releaseDate = "releaseDate";
  static const String title = "title";
  static const String voteAverage = "voteAverage";
  static const String dbname = "movie_db.db";

  Future<Database> get database async {
    if (_database == null) {
      _database = await openDb();
      return _database!;
    } else {
      if (!_database!.isOpen) {
        _database = await openDb();
      }
      return _database!;
    }
  }

  openDb() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, dbname);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE favorite ($id int primary key,$backdropPath text,$posterPath text,$title text,$popularity text,$originalTitle text,$releaseDate text,$voteAverage double)");
  }

  Future<Favorite>? save(Favorite favorite) async {
    var client = await database;
    try {
      favorite.id = await client.insert(table, favorite.toMap());
    } on Exception catch (_) {
      update(favorite);
    }
    return favorite;
  }

  Future<List<Favorite>> getFavorites() async {
    var client = await database;
    List<Map<String, dynamic>> map = await client.query(table);
    List<Favorite> favorites = [];
    if (map.isNotEmpty) {
      for (var element in map) {
        favorites.add(Favorite.fromMap(element));
      }
    }
    return favorites;
  }

  Future<int> delete(int fId) async {
    var client = await database;
    return await client.delete(table, where: "$id=?", whereArgs: [fId]);
  }

  Future<int> update(Favorite favorite) async {
    var client = await database;
    return await client.update(table, favorite.toMap(),
        where: "$id=?", whereArgs: [favorite.id]);
  }

  Future close() async {
    var client = await database;
    client.close();
  }
}
