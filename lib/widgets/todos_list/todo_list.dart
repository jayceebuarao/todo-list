import 'package:flutter/material.dart';
import 'package:todo_list/widgets/models/todo.dart';
import 'package:todo_list/widgets/todos_list/todo_item.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key, required this.todos});

  final List<ToDo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) => ToDoItem(todo: todos[index]),
    );
  }
}
