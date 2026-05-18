import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];
  final _mybox = Hive.box('mybox');

  void initialData() {
    todoList = [
      ["Clean My Room", false],
      ["Study for an Hour", false],
    ];
  }

  void loadData() {
    todoList = _mybox.get("TODOLIST");
  }

  void updateData() {
    _mybox.put("TODOLIST", todoList);
  }
}
