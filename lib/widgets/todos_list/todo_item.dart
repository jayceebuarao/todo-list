import 'package:flutter/material.dart';
import 'package:todo_list/widgets/models/todo.dart';

class ToDoItem extends StatefulWidget {
  const ToDoItem({super.key, required this.todo});

  final ToDo todo;

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    bool checkboxValue = widget.todo.isDone;

    return Card(
      color: const Color.fromARGB(255, 255, 254, 194),
      child: CheckboxListTile(
        value: checkboxValue,
        onChanged: (value) {
          setState(() {
            checkboxValue = value!;
            widget.todo.isDone = value;
          });
        },
        title: Text(widget.todo.task),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }
}
