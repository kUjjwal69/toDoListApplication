import 'package:hive/hive.dart';

class ToDoDatabase{

  List ToDoList = [];

  // refrence the box

  final _myBox = Hive.box("myBox");

// run this if it is the first time ever opening the app
  void createInitialData(){
ToDoList = [
["Make Tutorial", false],
["Do Exercise", false],
];
  }


  // load the data
  // from data base

  void loadData(){
    ToDoList = _myBox.get("TODOLIST");
  }

  // update the database

  void updateDatabse(){
    _myBox.put("TODOLIST", ToDoList);
  }
}