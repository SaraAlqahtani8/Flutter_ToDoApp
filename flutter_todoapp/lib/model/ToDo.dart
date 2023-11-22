// TODO Implement this library.\

import 'package:flutter/material.dart';
import 'package:flutter_todoapp/Screens/home.dart';

class ToDo {
  String? id;
  String? toDoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.toDoText,
    this.isDone = false,
  });

//list

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', toDoText: 'Morning Sport', isDone: true),
      ToDo(id: '02', toDoText: 'Study', isDone: true),
      ToDo(id: '03', toDoText: 'Programming1', isDone: false),
      ToDo(id: '04', toDoText: 'Programming2', isDone: false),
      ToDo(id: '05', toDoText: 'Programming3', isDone: false),
      ToDo(id: '06', toDoText: 'Programming4', isDone: false),
      ToDo(
        id: '04',
        toDoText: 'Study course',
      ),
    ];
  }
}
