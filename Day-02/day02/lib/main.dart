import 'package:flutter/material.dart';
import 'bottom_navigation_widget.dart';
void main()=>runApp(new MyApp());

/* stlss */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter bottomNavigationBar',
      theme:ThemeData.light(),
      home: BottomNavigationWidget()
    );
  }
}