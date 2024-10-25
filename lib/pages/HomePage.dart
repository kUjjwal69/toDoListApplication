// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/util/dialogbox.dart';
import 'package:to_do_app/util/todoPages.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


// refrence  the hive box
final _mBox = Hive.box("myBox");
ToDoDatabase db = ToDoDatabase();

@override
  void setState(VoidCallback fn) {
    
    // if it is the first time ever creating the app,
    // then create default data
  if(_mBox.get("TODOLIST") == null){
    db.createInitialData();
  }
  else{
    // there is some data
    db.loadData();
  }

    super.setState(fn);
  }


  final _controller = TextEditingController();
  

 void checkBoxChanged(bool? value, int index) {
  if (value == true) {
    // Task completed, remove it from the list
    setState(() {
      db.ToDoList.removeAt(index);
    });
  } else {
    // Task marked as incomplete, handle as needed
  }
}

// save a new task
  void saveNewTask() {
    setState(() {
      db.ToDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    _controller.clear();
  }
// create a new task
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

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow[200],
        
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title:  Center(
            child: Text("TO DO"),
          ),
          elevation: 0.0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: Colors.yellow,
        ),
       
        body: ListView(
          physics: AlwaysScrollableScrollPhysics(), // Ensure the list is always scrollable
          children: [
            for (int index = 0; index < db.ToDoList.length; index++)
              ToDoTile(
                taskName: db.ToDoList[index][0],
                taskCompleted: db.ToDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
              ),
          ],
        ),
        ),
    );
  }
}
