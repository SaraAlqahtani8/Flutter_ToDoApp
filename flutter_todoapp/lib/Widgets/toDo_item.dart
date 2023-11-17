// TODO Implement this library.

import 'package:flutter/material.dart';
import 'package:flutter_todoapp/model/ToDo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo toDo;

  const ToDoItem({Key? key, required this.toDo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          toDo.isDone
              ? Icons.check_box
              : Icons.check_box_outline_blank_outlined,
          color: Colors.red,
        ),
        title: Text(toDo.toDoText!,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: toDo.isDone ? TextDecoration.lineThrough : null,
            )),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(5)),
          child: IconButton(
            color: Colors.redAccent,
            iconSize: 18,
            icon: Icon(Icons.delete),
            onPressed: () {
              print('delete');
            },
          ),
        ),
      ),
    );
  }
}
