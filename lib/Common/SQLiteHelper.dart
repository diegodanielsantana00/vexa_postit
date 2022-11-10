// ignore_for_file: file_names, avoid_init_to_null, unused_local_variable, argument_type_not_assignable_to_error_handler, non_constant_identifier_names

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:vexa_postit/Areas/Home/Models/PostIt.dart';
import 'package:vexa_postit/Common/GlobalFunctions.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;
  DatabaseHelper._crateInstance();

  factory DatabaseHelper() => _databaseHelper ??= DatabaseHelper._crateInstance();

  Future<Database> get database async => _database ??= await initializeDatabase();

  Future<Database> initializeDatabase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = "${dir.path}kdi2pkmr_39skdi.db";
    var exercisesDatabase = await openDatabase(path, version: 1, onCreate: _createDatabase);

    return exercisesDatabase;
  }

  void _createDatabase(Database db, int version) async {
    await db.execute("CREATE TABLE postit(id INTEGER primary key autoincrement, text TEXT);");

    await db.execute("INSERT INTO version (version) VALUES('${await GetVersion()}');");
  }

  Future<int> insertDatabase(String table, dynamic object, {Database? database2}) async {
    var result = null;
    if (database2 == null) {
      Database db = await database;
      result = db.insert(table, object.toMap());
    } else {
      result = database2.insert(table, object.toMap());
    }
    return result;
  }

  Future<void> executeStringLocal(String sql) async {
    Database db = await database;
    dynamic result;
    if (sql.toLowerCase().contains("delete")) {
      result = await db.rawDelete(sql);
    } else if (sql.toLowerCase().contains("insert")) {
      result = await db.rawInsert(sql);
    } else {
      await db.execute(sql);
    }
  }

  // Future<List<Task>> getTask() async {
  //   Database db = await database;
  //   var result = await db.query("task");
  //   return result.isNotEmpty ? result.map((c) => Task.fromMap(c)).toList() : [];
  // }

  // Future<void> updateTypeCheck(String type, int id_type) async {
  //   Database db = await database;

  //   await db.rawUpdate('''
  //   UPDATE task_type 
  //   SET check_task = ?
  //   WHERE id = ?
  //   ''', [type, id_type]);
  // }


  // Future<void> deleteTask(int id_task) async {
  //   Database db = await database;

  //   await db.rawUpdate('''
  //   DELETE FROM task 
  //   WHERE id = ?
  //   ''', [id_task]);

  //   await db.rawUpdate('''
  //   DELETE FROM task_type 
  //   WHERE id_task = ?
  //   ''', [id_task]);
  // }

  Future<List<PostIt>> getMatter() async {
    Database db = await database;
    var result = await db.query("postit");
    return result.isNotEmpty ? result.map((c) => PostIt.fromMap(c)).toList() : [];
  }

  //   Future<List<Cards>> getCard(int id_metter) async {
  //   Database db = await database;
  //   var result = await db.query("card", where: "id_matter = $id_metter");
  //   return result.isNotEmpty ? result.map((c) => Cards.fromMap(c)).toList() : [];
  // }

  Future<String> getLastVersion() async {
    Database db = await database;
    var result = await db.query("version");
    return result[result.length - 1]["version"].toString();
  }

  Future close() async {
    Database db = await database;
    db.close();
  }
}
