import 'package:flutter/material.dart';

class ToDos extends StatefulWidget {
  const ToDos({super.key});

  @override
  State<ToDos> createState() => _ToDosState();
}

class _ToDosState extends State<ToDos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: const Column(
        children: [
          Text('List Items Goes Here'),
          Text('Hello world'),
        ],
      ),
    );
  }
}
