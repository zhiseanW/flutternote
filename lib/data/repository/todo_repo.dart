import 'package:hello_flutter/data/db/todo_db.dart';
import 'package:hello_flutter/data/model/todo.dart';

class TodoRepo {
  static final TodoRepo _instance = TodoRepo._internal();

  factory TodoRepo() {
    return _instance;
  }

  TodoRepo._internal();

  Future<void> addTodo(Todo todo) async {
    await TodoDatabase.insertTodo(todo);
  }

  Future<List<Todo>> getAllTodos() async {
    // return todos.values.toList();
    var mapOfTodos = await TodoDatabase.getAllTodos();
    return mapOfTodos.map((value) => Todo.fromMap(value)).toList();
  }

  Future<Todo?> getTodoById(int id) async {
    // return todos[id];

    var res = await TodoDatabase.getTodoById(id);
    if (res.isEmpty) {
      return null;
    }
    return Todo.fromMap(res[0]);
  }

  Future<void> updateTodo(Todo todo) async {
    TodoDatabase.updateTodo(todo);
  }

  Future<void> deleteTodo(int id) async {
    TodoDatabase.deleteTodo(id);
  }
}
