import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: new AppBar(
          title: new Text('ListView Widget'),
        ),


        // body: new Text('ListView Text'),

        // body: new ListView(
        //   children:<Widget>[
        //     new ListTile(
        //       leading: new Icon(Icons.access_time),
        //       title: new Text('access_time'),
        //     ),
        //     new ListTile(
        //       leading: new Icon(Icons.account_balance),
        //       title: new Text('account_balance'),
        //     ),
        //   ]
        // ),


        body: new ListView(
          children:<Widget>[
            new Image.network(
              'http://jspang.com/static/upload/20181111/G-wj-ZQuocWlYOHM6MT2Hbh5.jpg'
            ),
            new Image.network(
              'http://jspang.com/static/upload/20181109/1bHNoNGpZjyriCNcvqdKo3s6.jpg'
            ),
            new Image.network(
              'http://jspang.com/static/myimg/typescript_banner.jpg'
            ),new Image.network(
              'http://jspang.com/static/myimg/smile-vue.jpg'
            )
          ]
        ),


      ),
    );
  }
}
