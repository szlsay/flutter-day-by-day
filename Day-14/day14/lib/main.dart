import 'package:flutter/material.dart';

void main() => runApp(MyApp(
  items: new List<String>.generate(1000, (i)=>'Item $i'),
));

class MyApp extends StatelessWidget {

  final List<String> items;
  MyApp({Key key, @required this.items}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(

        // body: Center(
        //   child: Container(
        //     height: 200,
        //     // child: MyList(),
        //   ),
        // ),

        appBar: new AppBar(title: new Text('ListView Widget'),),
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index){
            return new ListTile(
              title: new Text('${items[index]}'),
            );
          },
        ),

      ),
    );
  }
}


class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
              children: <Widget>[
                new Container(
                  width: 180,
                  color: Colors.lightBlue,
                ),

                new Container(
                  width: 180,
                  color: Colors.amber,
                ),

                new Container(
                  width: 180,
                  color: Colors.deepOrange,
                ),

                new Container(
                  width: 180,
                  color: Colors.deepPurpleAccent,
                ),

              ],
    );
  }
}