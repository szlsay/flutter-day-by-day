import 'package:flutter/material.dart';
import 'bottom_navigation_widget.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BottomNavigationBar',
      theme: ThemeData.light(),
      home: BottomNavigationWidget(),
    );
  }
}