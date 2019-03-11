import 'package:flutter/material.dart';
import '../service/service_method.dart';


class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent='正在获取数据';
  @override
  void initState() {
    getHomePageContent().then((val){
      setState(() {
           homePageContent=val.toString();
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('百姓生活+'),
      ),
      body:SingleChildScrollView(
        child:  Text(homePageContent) ,
      )
    );
  }
}