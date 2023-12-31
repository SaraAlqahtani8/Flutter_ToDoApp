//import 'dart:developer';
//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todoapp/constant/color.dart';
import 'package:flutter_todoapp/Widgets/toDo_item.dart';
import 'package:flutter_todoapp/model/ToDo.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDo.todoList();
  List<ToDo> FoundTODO = [];
  final ToDoController = TextEditingController();

  @override
  void initState() {
    FoundTODO = todoList;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar_(),
      body: Stack(
        children: [
          Container(
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
                      for (ToDo toDo in FoundTODO.reversed)
                        ToDoItem(
                          toDo: toDo,
                          handel_ToDO: handel_ToDO,
                          OnDeleteItem: DeleteItem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: ToDoController,
                      decoration: InputDecoration(
                          hintText: 'Add new toDo item!',
                          border: InputBorder.none),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    onPressed: () {
                      AddtoDoItem(ToDoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: CRed,
                        minimumSize: Size(60, 60),
                        elevation: 10),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void handel_ToDO(ToDo toDo) {
    setState(() {
      toDo.isDone = !toDo.isDone;
    });
  }

  void DeleteItem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void AddtoDoItem(String toDo) {
    setState(() {
      todoList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          toDoText: toDo));
    });
    ToDoController.clear();
  }

  void Runfillter(String KeyWord) {
    List<ToDo> Result = [];
    if (KeyWord.isEmpty) {
      Result = todoList;
    } else {
      Result = todoList
          .where((item) =>
              item.toDoText!.toLowerCase().contains(KeyWord.toLowerCase()))
          .toList();
      setState(() {
        FoundTODO = Result;
      });
    }
  }

  Widget Search_Box() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => Runfillter(value),
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
