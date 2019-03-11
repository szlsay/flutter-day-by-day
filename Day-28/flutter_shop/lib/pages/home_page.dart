import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("首页商城"),
      ),
    );
  }
}