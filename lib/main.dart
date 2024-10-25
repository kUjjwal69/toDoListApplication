// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/pages/HomePage.dart';
void main() async{

// initialize the hive
await Hive.initFlutter();

// open the box

var mbox = await Hive.openBox("myBox");



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.yellow,
      primaryColor: Colors.yellow),
    );
  }
}