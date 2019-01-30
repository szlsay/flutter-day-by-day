import 'package:flutter/material.dart';

class ToolTipDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('tool tips demo'),),
      body: Center(
        child: Tooltip(
          message: '我是大美女',
          child: Image.network('https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2241728227,479046359&fm=200&gp=0.jpg')
        ),
      ),
    );
  }
}
