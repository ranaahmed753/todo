import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo/todo.dart';
import 'package:todo/custom_list.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<ToDo> todos = <ToDo>[];
  var nameController = TextEditingController();
  var updateNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x4C4C4C4C),
      appBar: AppBar(
        backgroundColor: const Color(0x4C4C4C4C),
        title: const Text(
          'Todo App',
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        width: double.infinity,
        child: CustomList(
          todos: todos,
          deleteToDo: deleteToDo,
          updateToDo: updateToDo,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createToDo(context);
          print('Add toDo');
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }

  createToDo(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New ToDo'),
          content: TextField(
            controller: nameController,
            decoration: const InputDecoration(hintText: 'add todo'),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextButton(
                child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Add', style: TextStyle(fontSize: 16))),
                onPressed: () {
                  Navigator.of(context).pop();
                  setState(() {
                    todos.add(ToDo(name: nameController.text));
                    nameController.clear();
                  });
                },
              ),
            ),
          ],
        );
      },
    );
  }

  deleteToDo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  updateToDo(int index) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('update todo '),
          content: TextField(
            controller: updateNameController,
            decoration: const InputDecoration(hintText: 'update your todo'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Update',
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  todos[index] = ToDo(name: updateNameController.text);
                  updateNameController.clear();
                });
              },
            ),
          ],
        );
      },
    );
  }
}
