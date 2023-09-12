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

  void sortToDo() {
    setState(() {
      _registeredToDos.sort((a, b) {
        return a.task.toLowerCase().compareTo(b.task.toLowerCase());
      });
    });
  }

  void addNewToDo(ToDo newTodo) {
    setState(() {
      _registeredToDos.add(newTodo);
    });
  }

  void removeToDo(ToDo removeTodo) {
    setState(() {
      _registeredToDos.remove(removeTodo);
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
        title: const Text('To Do'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: sortToDo,
            icon: const Icon(Icons.sort),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ToDoList(
            todos: _registeredToDos,
            onDismiss: removeToDo,
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: openNewToDoModal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
