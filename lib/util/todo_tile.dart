// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  ToDoTile({
    super.key,
    required this.taskName,
    required this.takCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  final String taskName;
  final bool takCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext) deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteFunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(90),
          )
        ]),
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
      ),
    );
  }
}
