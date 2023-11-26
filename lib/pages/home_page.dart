// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:to_do/util/todo_tile.dart';

import '../util/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //text controller
  final _controller = TextEditingController();
  //list todo
  List toDoList = [
    ["make tutorial", false],
    ["Bringle", false],
  ];
  //save new task
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // crate a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(child: Text("TO - DO")),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createNewTask();
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            takCompleted: toDoList[index][1],
            onChanged: (value) {
              checkBoxChanged(
                value,
                index,
              );
            },
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
      // body: ListView(
      //   children: [
      //     ToDoTile(
      //       taskName: "learn flutter",
      //       takCompleted: true,
      //       onChanged: null,
      //     ),
      //   ],
      // ),
    );
  }
}
