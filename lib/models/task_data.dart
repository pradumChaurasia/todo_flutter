import 'package:flutter/foundation.dart';
import 'package:todo_flutter/models/Task.dart';
import 'dart:collection';


class TaskData extends ChangeNotifier{

  List <Task> _tasks=[
    Task(name:'Buy milk',isDone: false),
    Task(name:'Buy food',isDone: false),
    Task(name:'Buy fruit',isDone: false),

  ];
  UnmodifiableListView<Task> get tasks{
      return UnmodifiableListView(_tasks);
  }


  //getter
  int get taskCount{
    return _tasks.length;
  }

  void addTask(String newTaskTiitle){
    final task=Task(name:newTaskTiitle,isDone: false);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.ToggleDone();
    notifyListeners();
  }

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

}

