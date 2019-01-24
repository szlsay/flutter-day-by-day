import 'package:flutter/material.dart';
import 'frosted_class_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter Demo of ST',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: FrostedClassDemo(),
      ),
    );
  }
}