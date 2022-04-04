import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_todo/models/todo.dart';

class TodoRepository extends ChangeNotifier {
  List<Todo> _todos = [Todo(id: 'kek', title: 'App', description: "Doing")];

  List<Todo> getTodoList() {
    return _todos;
  }

  void addNewTodo({
    required String title,
    required String description,
  }) {
    final String id = _getRandomString();

    _todos.add(
      Todo(
        id: id,
        title: title,
        description: description,
      ),
    );
    notifyListeners();
  }

  void updateTodo(Todo updateTodo) {
    _todos.forEach((todo) {
      if (todo.id == updateTodo.id) {
        _todos.remove(todo);
        _todos.add(updateTodo);
      }
    });
    notifyListeners();
  }

  void deleteTodo(String todoId) {
    _todos.forEach((todo) {
      if (todo.id == todoId) {
        _todos.remove(todo);
      }
    });
    notifyListeners();
  }

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  static final _rnd = Random();

  static String _getRandomString() {
    return String.fromCharCodes(
      Iterable.generate(
        20,
        (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
      ),
    );
  }
}
