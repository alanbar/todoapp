// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: use_key_in_widget_constructors
class NewTodo extends StatefulWidget {
  final Function(String) addTodo;

  NewTodo({required this.addTodo});

  //NewToDo({required addTodo});

  @override
  State<StatefulWidget> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final TextEditingController _todoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            controller: _todoController,
            decoration: const InputDecoration(labelText: "Enter New Todo"),
          ),
          TextButton(
              onPressed: () {
                widget.addTodo(_todoController.text);
                Navigator.of(context).pop();
              },
              child: const Text("Add"))
        ],
      ),
    );
  }
}
