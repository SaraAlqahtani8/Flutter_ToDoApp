// TODO Implement this library.

import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(Icons.check_box, color: Colors.red),
        title: Text('check mail',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              decoration: TextDecoration.lineThrough,
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