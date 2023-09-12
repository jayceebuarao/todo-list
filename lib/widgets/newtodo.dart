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
    if (_toDoTextController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please type out a task'),
        behavior: SnackBarBehavior.floating,
      ));
      return;
    }
    widget.updateToDo(ToDo(task: _toDoTextController.text));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _toDoTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: 'Task',
            ),
            controller: _toDoTextController,
          ),
          const Spacer(),
          Row(children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); //removes widget from screen
              },
              child: const Text('Cancel'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: saveNewItem,
              child: const Text('Save'),
            ),
          ]),
        ],
      ),
    );
  }
}
