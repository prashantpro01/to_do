// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  ToDoTile({
    super.key,
    required this.taskName,
    required this.takCompleted,
    required this.onChanged,
  });

  final String taskName;
  final bool takCompleted;
  Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(90)),
        child: Row(
          children: [
            //checkbox
            Checkbox(
              value: takCompleted,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
            Text(
              taskName,
              style: TextStyle(
                  decoration: takCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}
