import 'dart:developer';
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbService {
  static const _databaseName = "Todo.db";
  static const _databaseVersion = 1;

  static const table = 'Todo';

  static const mId = 'id';
  static const mTitle = 'title';
  static const mSubTitle = 'subTitle';

  ///
  DbService._() {
    ///
    database;
  }

  ///
  static DbService get instance => DbService._();

  ///
  static Database? _database;

  ///
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    ///DIRECTORY PATH
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    ///GETTING PATH WITH DATABASE NAME
    String databasePath = path.join(documentsDirectory.path, _databaseName);

    log("Database Path $databasePath");

    ///CREATE DATABASE
    return await openDatabase(
      databasePath,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  ///
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $mId INTEGER PRIMARY KEY,                        
            $mTitle TEXT NOT NULL,
            $mSubTitle TEXT NOT NULL
          )
          ''');
  }

  ///
  Future<int> insert({required String title, required String subTitle}) async {
    ///
    _database ??= await database;

    ///
    int id = await _database!.insert(
      table,
      {
        mTitle: title,
        mSubTitle: subTitle,
      },
    );

    return id;
  }

  ///
  Future<int> delete({required int id}) async {
    ///
    _database ??= await database;

    

    ///
    var result = _database!.delete(
      table,
      where: '$mId = ?',
      whereArgs: [id],
    );
    return result;
  }

  ///
  Future<List<Map<String, dynamic>>> read() async {
    ///
    _database ??= await database;
    var result =
        await _database!.query(table, columns: [mId, mTitle, mSubTitle]);
    return result;
  }

  ///
  Future<int> update({
    required String title,
    required String subTitle,
    required int id,
  }) async {
    ///
    _database ??= await database;

    ///
    var result = await _database!.update(
      table,
      {
        mTitle: title,
        mSubTitle: subTitle,
      },
      where: '$mId = ?',
      whereArgs: [id],
    );
    return result;
  }
}
