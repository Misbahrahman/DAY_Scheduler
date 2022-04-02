import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(label: 'Buy Milk', checked: false),
    Task(label: 'Buy Eggs', checked: true),
    Task(label: 'Buy Bread', checked: false),
  ];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount {
    return _tasks.length;
  }

  int get openTaskCount {
    return _tasks.where((element) => element.checked == false).length;
  }

  void addTask(String newTaskLabel) {
    _tasks.add(Task(label: newTaskLabel));
    notifyListeners();
  }

  void updateTask(Task task){
    task.changeChecked();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}