// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import "package:flutter/material.dart";

import "my_button.dart";

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 120,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          //get user input
          TextField(
            controller: controller,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter your new Task",
            ),
          ),
          //buttons-- save and cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(text: "Save", onPressed: onSave),
              const SizedBox(
                width: 10,
              ),
              MyButton(text: "Cancel", onPressed: onCancel)
            ],
          )
        ]),
      ),
    );
  }
}
