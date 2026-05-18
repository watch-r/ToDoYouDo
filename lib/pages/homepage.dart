import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoyoudo/data/database.dart';

import '../utils/dialogue_box.dart';
import '../utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final _mybox = Hive.box('mybox');
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    if (_mybox.get("TODOLIST") == null) {
      db.initialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
  }

  void saveNewTask() {
    final String taskName = _controller.text;
    setState(() {
      db.todoList.add([taskName, false]);
      _controller.clear();
    });

    _listKey.currentState?.insertItem(db.todoList.length - 1);

    db.updateData();
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogueBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TO DO YOU DO"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNewTask(),
        backgroundColor: Colors.green[500],
        elevation: 4,
        child: Icon(Icons.add),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.green[200]!, Colors.white],
          ),
        ),
        child: SafeArea(
          child: AnimatedList(
            key: _listKey,
            initialItemCount: db.todoList.length,
            itemBuilder: (context, index, animation) {
              return SizeTransition(
                sizeFactor: animation,
                child: TodoTile(
                  taskName: db.todoList[index][0],
                  taskCompleted: db.todoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteTask: (context) => deleteTask(index),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void deleteTask(int index) {
    final removedItem = db.todoList[index];
    setState(() {
      db.todoList.removeAt(index);
    });

    _listKey.currentState?.removeItem(
      index,
      (context, animation) => TodoTile(
        taskName: removedItem[0],
        taskCompleted: removedItem[1],
        onChanged: (value) {}, // No-op during deletion
        deleteTask: (context) {}, // No-op during deletion
      ),
      duration: const Duration(milliseconds: 300),
    );
    db.updateData();
  }
}
