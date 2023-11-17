//import 'dart:developer';
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todoapp/constant/color.dart';
import 'package:flutter_todoapp/Widgets/toDo_item.dart';
import 'package:flutter_todoapp/model/ToDo.dart';
class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);
final todoList=ToDo.todoList();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar_(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Search_Box(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 30, bottom: 20),
                    child: Text(
                      'All ToDoList',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  for(ToDo toDo in todoList)
                  ToDoItem(toDo: toDo,),
                
                 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Search_Box() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search, color: Colors.grey, size: 20),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 15,
            minWidth: 20,
          ),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  AppBar AppBar_() {
    return AppBar(
        backgroundColor: Colors.grey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: CRed,
              size: 30,
            ),
            Container(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/images/Avatar.png'),
              ),
            ),
          ],
        ));
  }
}
