import 'package:flutter/material.dart';

import '../model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoModel> _todos = [];

  List<TodoModel> get todos => _todos;

  void addTodo(TodoModel todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void deleteTodo(int id) {
    int index = _todos.indexWhere((t) => t.id == id);

    if (index != -1) {
      _todos.removeAt(index);
      notifyListeners();
    }
  }  void deleteAll( ) {

      _todos.clear();
      notifyListeners();

  }



  void markedAllCompleted() {
    if (_todos.isEmpty) {
      return;
    }
    final todos=_todos.map((e) => e.copyWith(completed: true)).toList();
     _todos=todos;

    notifyListeners();
  }

  void unmarkedAll() {
    if (_todos.isEmpty) {
      return;
    }
    _todos = _todos.map((e) => e.copyWith(completed: false)).toList();
    notifyListeners();
  }


}
