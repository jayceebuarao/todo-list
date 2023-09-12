import 'package:flutter/material.dart';
import 'package:todo_list/widgets/models/todo.dart';
import 'package:todo_list/widgets/newtodo.dart';
import 'package:todo_list/widgets/todos_list/todo_list.dart';

class ToDos extends StatefulWidget {
  const ToDos({super.key});

  @override
  State<ToDos> createState() => _ToDosState();
}

class _ToDosState extends State<ToDos> {
  final List<ToDo> _registeredToDos = [ToDo(task: 'Your Mom', isDone: false)];

  void addNewToDo(ToDo newTodo) {
    setState(() {
      _registeredToDos.add(newTodo);
    });
  }

  void openNewToDoModal() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Scaffold(body: NewTodo(updateToDo: addNewToDo)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: Column(
        children: [
          Expanded(child: ToDoList(todos: _registeredToDos)),
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: openNewToDoModal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
