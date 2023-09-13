import 'package:flutter/material.dart';

class Todo {
  final String id;
  final String todoText;
  bool isDone;

  Todo({required this.id,  required this.todoText, this.isDone = false});

  static List<Todo> todolist() {
    return [
      Todo(id: '1', todoText: 'Kehndi Yo Yo Honey Singha', isDone: true),
      Todo(id: '2', todoText: 'Kehndi Yo Yo Honey Singha', isDone: true),
      Todo(id: '3', todoText: 'Kehndi Yo Yo Honey Singha', isDone: false),
      Todo(id: '4', todoText: 'Kehndi Yo Yo Honey Singha', isDone: true),
      Todo(id: '5', todoText: 'Kehndi Yo Yo Honey Singha', isDone: false),
      Todo(id: '6', todoText: 'Kehndi Yo Yo Honey Singha', isDone: true),
      Todo(id: '7', todoText: 'Kehndi Yo Yo Honey Singha', isDone: false),
      Todo(id: '8', todoText: 'Kehndi Yo Yo Honey Singha', isDone: true),
      Todo(id: '9', todoText: 'Kehndi Yo Yo Honey Singha', isDone: false),
      Todo(id: '10', todoText: 'Kehndi Yo Yo Honey Singha', isDone: true),
    ];
  }
}
