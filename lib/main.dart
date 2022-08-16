import 'package:flutter/material.dart';
//import 'package:todoapp/Widgets/todo_cards.dart';
import 'package:todoapp/Widgets/todo_list.dart';
import 'package:uuid/uuid.dart';
import 'Widgets/Counter.dart';
import 'Widgets/new_todo.dart';
import 'models/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'mY.....',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required String title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Todo> todos = [
    Todo(id: const Uuid(), title: "Clean Room", completed: true),
    Todo(id: const Uuid(), title: "Pet the Cat", completed: false),
    Todo(id: const Uuid(), title: "Dance", completed: true)
  ];

  void updateTodoCompletions(int index) {
    setState(() {
      todos[index].completed =
          !todos[index].completed; //flips to opposite value
    });
  }

  void showAddTodoModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (bCtx) {
          return NewTodo(addTodo: _addTodo);
        });
  }

  void _addTodo(String todo) {
    setState(() {
      todos.add(Todo(id: const Uuid(), completed: false, title: todo));
    });
  }

  int calcTotalCompletions() {
    var totalCompletions = 0;

    todos.forEach((todo) {
      if (todo.completed) {
        totalCompletions++;
      }
    });
    return totalCompletions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Counter(
            numberOfTodos: todos.length,
            totalCompletions: calcTotalCompletions(),
          ),
          TodoList(todos: todos, updateTodoCompletions: updateTodoCompletions)
        ],
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showAddTodoModal(context);
          },
          child: const Icon(Icons.add)),
    );
  }
}
