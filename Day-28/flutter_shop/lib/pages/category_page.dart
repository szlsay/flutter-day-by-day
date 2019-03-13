import 'package:flutter/material.dart';
import '../service/service_method.dart';
import '../model/category.dart';
import 'dart:convert';

class CategoryPage extends StatefulWidget {
  final Widget child;

  CategoryPage({Key key, this.child}) : super(key: key);

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    _getCategory();
    return Container(
       child: Center(
         child: Text('分类界面'),
       )
    );
  }

  void _getCategory()async{
    await request('getCategory').then((val){
      var data =json.decode(val.toString());
      print(data);

      CategoryBigListModel list =CategoryBigListModel.formJson(data["data"]);
      list.data.forEach((item) => print(item.mallCategoryName));
    });
  }
}