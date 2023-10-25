// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  //text editing controller to get access to what the user typed
  TextEditingController mycontroller = TextEditingController();

  //greeting message variable
  String greetingMessage = "";

  //great user method
  void greetUser() {
    String userName = mycontroller.text;
    setState(() {
      greetingMessage = "Hello, " + userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // great user message
            Text(greetingMessage),
            //text field
            TextField(
              controller: mycontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Type your name"),
            ),
            //botton
            ElevatedButton(onPressed: greetUser, child: Text("T A P"))
          ],
        ),
      )),
    );
  }
}
