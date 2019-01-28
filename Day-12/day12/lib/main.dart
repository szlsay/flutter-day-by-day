import 'package:flutter/material.dart';
//主函数（入口函数），下面我会简单说说Dart的函数
void main() => runApp(MyApp());
// 声明MyApp类
class MyApp extends StatelessWidget {
  //重写build方法
  @override
  Widget build(BuildContext context) {
    //返回一个Material风格的组件
    return MaterialApp(
      title: 'Welcome to Flutter-ios',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(


          // child: Text(
          //   'Hello, world, 我是一个很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长很长的字符串',
          //   textAlign: TextAlign.justify,
          //   maxLines: 1,
          //   overflow:TextOverflow.ellipsis,

          //   style: TextStyle(
          //     fontSize: 15,
          //     color: Color.fromARGB(255, 255, 150, 150),
          //     decoration:TextDecoration.underline,
          //     decorationStyle: TextDecorationStyle.solid,
          //   ),
          // ),
          

          // child: Container(
          //   child: new Text('Hello, world', style: TextStyle(fontSize: 40),),
          //   alignment: Alignment.topLeft,
          //   width: 500,
          //   height: 400,
          //   // color: Colors.lightBlue,
          //   // padding: const EdgeInsets.all(10),
          //   padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
          //   margin: const EdgeInsets.all(10.0),

          //   decoration: new BoxDecoration(
          //     gradient: const LinearGradient(
          //       colors: [Colors.lightBlue, Colors.greenAccent, Colors.purple]
          //     ),
          //     border: Border.all(width: 2.0, color: Colors.red)
          //   ),
          // ),

          child: Container(
            child: new Image.network(
              'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2382313905,2591688010&fm=200&gp=0.jpg',
              // scale : 1.0,
              color: Colors.greenAccent,
              colorBlendMode: BlendMode.darken,
              repeat: ImageRepeat.repeatY,
            ),
            width:300.0,
            height:600.0,
            color: Colors.lightBlue,
          ),

        ),
      ),
    );
  }
}