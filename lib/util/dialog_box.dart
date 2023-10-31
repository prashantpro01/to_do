// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import "package:flutter/material.dart";

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 120,
        child: Column(children: [
          //get user input
          TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your new Task",
            ),
          ),
          //buttons-- save and cancel
        ]),
      ),
    );
  }
}
