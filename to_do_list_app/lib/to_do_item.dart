import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'models/tofo.dart';

class TodoItem extends StatelessWidget {
  final Todo toDoo;
  final onTodoChanged;
  final onTodoDelete;

  TodoItem(
      {super.key, required this.toDoo, this.onTodoChanged, this.onTodoDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: ListTile(
        onTap: () {
          //print("Clicked on ToDo Item");
          onTodoChanged(toDoo);
        },
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        tileColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        leading: Icon(
          toDoo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.purple[900],
        ),
        title: Text(toDoo.todoText),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(
            vertical: 6.0,
          ),
          decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: IconButton(
            onPressed: () {
              // print("Clicked on Delete Button");
              onTodoDelete(toDoo.id);
            },
            iconSize: 22.0,
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
