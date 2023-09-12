import 'package:flutter/material.dart';
import 'package:todo_list/widgets/models/todo.dart';
import 'package:todo_list/widgets/todos_list/todo_item.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key, required this.todos, required this.onDismiss});

  final void Function(ToDo) onDismiss;

  final List<ToDo> todos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      itemCount: todos.length,
      itemBuilder: (context, index) => Dismissible(
          key: ValueKey(todos[index].task),
          onDismissed: (direction) => onDismiss(todos[index]),
          child: ToDoItem(todo: todos[index])),
    );
  }
}
