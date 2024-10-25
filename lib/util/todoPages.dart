// ignore_for_file: sort_child_properties_last, use_super_parameters, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class ToDoTile extends StatefulWidget {
  final String taskName;
  final bool taskCompleted;
  final ValueSetter<bool?>? onChanged;

   ToDoTile({
    Key? key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),

          
            child: Container(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Checkbox(
                    value: widget.taskCompleted,
                    onChanged: widget.onChanged,
                    activeColor: Colors.black,
                  ),
                  Text(
                    widget.taskName,
                    style: TextStyle(
                      decoration: widget.taskCompleted ? 
                      TextDecoration.lineThrough : TextDecoration.none,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          
    );
  }
}
