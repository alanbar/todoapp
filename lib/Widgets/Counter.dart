// ignore: file_names
import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  // const Counter({Key? key}) : super(key: key);

  final int numberOfTodos;
  final int totalCompletions;

  Counter({required this.numberOfTodos, required this.totalCompletions});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(40),
      child: Text(
        "$totalCompletions/$numberOfTodos",
        style: const TextStyle(
          fontSize: 75,
        ),
      ),
    );
  }
}
