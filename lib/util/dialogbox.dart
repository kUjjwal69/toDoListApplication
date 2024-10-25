// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters, must_be_immutable
// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import 'package:to_do_app/util/my_Buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    Key? key,
    required this.onSave,
    required this.onCancel, this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)),
        backgroundColor: Colors.yellow,
      content: SizedBox(
        
        height: 120,
        width: 200,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new Task",
              ),
            ),


              // buttons -> save -> cancel
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // save button
                MyButtons(text: "Save", onPressed: onSave),

                const SizedBox(
                  width: 8,
                ),
                  // cancel button

                  MyButtons(text: "Cancel", onPressed: onCancel)
                ],
              )
            
          ],
        ),
       
        
      ),
    );
  }
}
