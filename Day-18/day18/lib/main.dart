import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
                var stack = new Stack(
                  // alignment: const FractionalOffset(0.5, 0.9),
                  children: <Widget>[
                    new CircleAvatar(
                      backgroundImage: new NetworkImage('https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1933812274,3843489449&fm=27&gp=0.jpg'),
                      radius: 100.0,
                    ),
            
            
                    // new Container(
                    //   decoration: new BoxDecoration(
                    //     color: Colors.lightBlue,
                    //   ),
            
                    //   padding: EdgeInsets.all(5.0),
                    //   child: new Text('ST'),
                    // )
            
                    new Positioned(
                      top: 10.0,
                      left: 10.0,
                      child: new Text('ST.com'),
                    ),
            
                    new Positioned(
                      bottom: 10.0,
                      right: 10.0,
                      child: new Text('技术分享'),
        ),

      ],
    );

   return MaterialApp(
      title:'ListView widget',
      home:Scaffold(
        appBar:new AppBar(
          title:new Text('垂直方向布局'),
          ),
          body:Center(child:stack),
      ),
    );
  }
}