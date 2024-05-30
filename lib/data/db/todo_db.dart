import 'package:hello_flutter/data/model/todo.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class TodoDatabase {
  static Future<void> _createDatabase(Database db) async {
    await db.execute("""
      CREATE TABLE ${Todo.name} (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT NOT NULL,
        desc TEXT NOT NULL,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
    """);
  }

  static Future<void> _upgrade(
      Database db, int oldVersion, int newVersion) async {}

  static Future<Database> _openDb() async {
    var documents = await getApplicationDocumentsDirectory();
    var path = join(documents.path, "todo_database.db");
    return openDatabase(
      path,
      version: 2,
      onCreate: (db, version) => _createDatabase(db),
      onUpgrade: (db, oldVersion, newVersion) =>
          _upgrade(db, oldVersion, newVersion),
    );
  }

  static Future<List<Map<String, dynamic>>> getAllTodos() async {
    final db = await _openDb();
    return db.query(Todo.name, orderBy: "id");
  }

  static Future<int> insertTodo(Todo todo) async {
    final db = await _openDb();
    return db.insert(Todo.name, todo.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getTodoById(int id) async {
    final db = await _openDb();
    return db.query(Todo.name, where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateTodo(Todo todo) async {
    final db = await _openDb();
    return db
        .update(Todo.name, todo.toMap(), where: "id = ?", whereArgs: [todo.id]);
  }

  static Future<int> deleteTodo(int id) async {
    final db = await _openDb();
    return db.delete(Todo.name, where: "id = ?", whereArgs: [id]);
  }
}
