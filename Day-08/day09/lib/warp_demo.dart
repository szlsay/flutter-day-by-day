import 'package:flutter/material.dart';

class WarpDemo extends StatefulWidget {
  _WarpDemoState createState() => _WarpDemoState();
}

class _WarpDemoState extends State<WarpDemo> {

  List<Widget> list;

  @override
    void initState() {
      super.initState();
      list = List();
      list..add(buildAddButton());
    }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Wrap流失布局'),
      ),
      body: Center(
        child: Opacity(
          opacity: 0.8,
          child: Container(
          width: width,
          height: height/2,
          color: Colors.grey,
          child: Wrap(
            children: list,
            spacing: 26.0,
          ),
          ),
        ),
      ),
    );
  }

  Widget buildAddButton(){
    return GestureDetector(
      onTap: (){
        if(list.length < 9){

          setState(() {
                      list.insert(list.length-1, buildPhoto());
                    });

          // list.insert(list.length-1, buildPhoto());
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width:  80.0,
          height: 80.0,
          color: Colors.black54,
          child: Icon(Icons.add),

        ),
      ),
    );
  }

  Widget buildPhoto(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 80.0,
        height: 80.0,
        color: Colors.amber,
        child: Center(
          child: Text('Photo'),
        ),
      ),
    );
  }
}