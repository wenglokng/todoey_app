import 'package:todoey_app/models/task.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';

class TaskListProvider extends ChangeNotifier {
  List<Task> _toDoList = [
    Task(name: "Buy Milk"),
    Task(name: "Buy Cheese"),
    Task(name: "Buy Apple"),
  ];

  int get taskCount {
    return _toDoList.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_toDoList);
  }

  void addNewList(String newTask) {
    _toDoList.add(Task(name: newTask));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(int index){
    _toDoList.removeAt(index);
    notifyListeners();
  }
}
