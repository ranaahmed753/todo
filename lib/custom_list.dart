import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:todo/todo.dart';

class CustomList extends StatefulWidget {
  List todos;
  Function deleteToDo;
  Function updateToDo;
  CustomList(
      {required this.todos,
      required this.deleteToDo,
      required this.updateToDo});

  @override
  _CustomListState createState() => _CustomListState(
      todos: this.todos,
      deleteToDo: this.deleteToDo,
      updateToDo: this.updateToDo);
}

class _CustomListState extends State<CustomList> {
  List todos;
  Function deleteToDo;
  Function updateToDo;
  _CustomListState(
      {required this.todos,
      required this.deleteToDo,
      required this.updateToDo});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 8, bottom: 8),
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                todos[index].name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          deleteToDo(index);
                        });
                      },
                      iconSize: 30.0,
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      )),
                  IconButton(
                    onPressed: () {
                      updateToDo(index);
                    },
                    iconSize: 30.0,
                    icon: const Icon(
                      Icons.mode_edit,
                      color: Colors.green,
                    ),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
