import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    title: '页面跳转返回数据',
    home: FirstPage(),
  ));
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Call Phone'),),
      body: Center(
        child: RouteButton(),
      ),
    );
  }
}

class RouteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: (){
        _navigateToGirl(context);
      },
      child: Text('find girl'),
    );
  }

  _navigateToGirl(BuildContext context) async{
    final result = await Navigator.push(
      context, 
      MaterialPageRoute(builder: (context)=> GIRL())
    );
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('$result'),
    ));
  }
}

class GIRL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Girl'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('a long tui'),
              onPressed: (){
                Navigator.pop(context, 'long:15111111111');
              },
            ),
            RaisedButton(
              child: Text('a yao'),
              onPressed: (){
                Navigator.pop(context, 'yao:152222222');
              },
            )
          ],
        ),
      ),
    );
  }
}


