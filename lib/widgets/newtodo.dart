import 'package:flutter/material.dart';
import 'package:todo_list/widgets/models/todo.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({super.key, required this.updateToDo});

  final void Function(ToDo) updateToDo;

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final TextEditingController _toDoTextController = TextEditingController();

  void saveNewItem() {
    widget.updateToDo(ToDo(task: _toDoTextController.text));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Task',
            ),
            controller: _toDoTextController,
          ),
          ElevatedButton(
            onPressed: saveNewItem,
            child: const Text('Save'),
          )
        ],
      ),
    );
  }
}
