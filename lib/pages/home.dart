import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_dialog.dart';
import 'package:todo_app/widgets/todo_tile.dart';
import 'package:todo_app/models/todo_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = TextEditingController();
  final List<TodoItem> todos = [];

  void editTodo({required int index}) {
    controller.text = todos[index].title;
    showDialog(
        context: context,
        builder: (context) {
          return TodoDialog(
              title: 'Edit item',
              hintText: 'New title',
              controller: controller,
              onSave: () {
                setState(() {
                  todos[index].setTitle(controller.text);
                });
                controller.clear();
                Navigator.of(context).pop();
              },
              onCancel: () {
                controller.clear();
                Navigator.of(context).pop();
              });
        });
  }

  void createTodo() {
    showDialog(
        context: context,
        builder: (context) {
          return TodoDialog(
            title: 'Add item',
            hintText: 'Title',
            controller: controller,
            onSave: () {
              setState(() {
                todos.add(TodoItem(controller.text, false));
              });
              controller.clear();
              Navigator.of(context).pop();
            },
            onCancel: () {
              controller.clear();
              Navigator.of(context).pop();
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Widget populatedState = ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ToDoTile(
          task: todos[index].title,
          done: todos[index].completed,
          onChanged: (val) => setState(() {
            todos[index].setCompleted(val);
          }),
          onEdit: (context) => editTodo(index: index),
          onDelete: (p0) => setState(() => todos.removeAt(index)),
        );
      },
    );

    Widget emptyState = Container(
      alignment: Alignment.center,
      child: Text(
        'NOTHING LEFT TO DO!',
        style: TextStyle(fontSize: 32),
        textAlign: TextAlign.center,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('TODO LIST'),
        centerTitle: true,
      ),
      body: todos.isEmpty ? emptyState : populatedState,
      floatingActionButton: FloatingActionButton(
        onPressed: createTodo,
        child: Icon(Icons.add),
      ),
    );
  }
}
