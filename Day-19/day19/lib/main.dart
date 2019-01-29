import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var card = new Card(
      child: Column(
        children: <Widget>[
          ListTile(
            title: new Text('位置测试呵呵呵', style: TextStyle(fontWeight: FontWeight.w500),),
            subtitle: new Text('手机号：111111111111'),
            leading: new Icon(Icons.account_box, color: Colors.lightBlue,),
          ),

          new Divider(),

          ListTile(
            title: new Text('位置测服服服', style: TextStyle(fontWeight: FontWeight.w500),),
            subtitle: new Text('222222222222222'),
            leading: new Icon(Icons.account_box, color: Colors.lightBlue,),
          ),

          new Divider(),

          ListTile(
            title: new Text('位置嘿嘿嘿嘿嘿嘿', style: TextStyle(fontWeight: FontWeight.w500),),
            subtitle: new Text('222222222222222'),
            leading: new Icon(Icons.account_box, color: Colors.lightBlue,),
          ),

          new Divider(),

        ],
      ),
    );

    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('卡片布局'),
        ),
        body: Center(child: card),
      )
    );
  }
}
