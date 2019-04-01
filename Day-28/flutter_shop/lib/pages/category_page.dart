import 'package:flutter/material.dart';
import '../service/service_method.dart';
import '../model/category.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryPage extends StatefulWidget {
  final Widget child;

  CategoryPage({Key key, this.child}) : super(key: key);

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("商品分类"),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftCategoryNav(),
            Column(
              children: <Widget>[
                RightCategoryNav(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

//左侧导航菜单
// class LeftCategoryNav extends StatefulWidget {
//   _LeftCategoryNavState createState() => _LeftCategoryNavState();

// }

class LeftCategoryNav extends StatefulWidget {
  _LeftCategoryNavState createState() => _LeftCategoryNavState();

}


class _LeftCategoryNavState extends State<LeftCategoryNav> {
   List list=[];

  @override
  void initState() {
    _getCategory();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
 

    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        // color: Colors.white,
        border: Border(
          right: BorderSide(
            width: 1, color: Colors.black12
          )
        ) 
      ),
      child: ListView.builder(
        itemCount: list.length, 
        itemBuilder: (context, index) {
          return _leftInkWel(index);
        },
      ),
    );
  }

  Widget _leftInkWel(int index){
    return InkWell(
      onTap: (){},
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding:EdgeInsets.only(left:10,top:20),
        decoration: BoxDecoration(
          color: Colors.white,
          border:Border(
            bottom:BorderSide(width: 1,color:Colors.black12)
          )
        ),
        child: Text(list[index].mallCategoryName,style: TextStyle(fontSize:ScreenUtil().setSp(28)),),
      ),
    );
}

  void _getCategory()async{
    await request('getCategory').then((val){
      var data =json.decode(val.toString());
      print(data);

      CategoryModel category =CategoryModel.fromJson(data);
      setState(() {
        list =category.data;
      });
      // list.data.forEach((item) => print(item.mallCategoryName));
    });
  }
}

// class RightCategoryNav extends StatefulWidget {
//   @override
//   _RightCategoryNavState createState() => _RightCategoryNavState();
// }

class RightCategoryNav extends StatefulWidget {
  @override
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  List list = ["名酒", "宝丰", "北京二锅头", "五粮液", "茅台"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(80),
      width: ScreenUtil().setWidth(570),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(width: 1 , color: Colors.black12)
        )
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index){
          return _rightInkWell(list[index]);
        },
      ),

    );
  }

  Widget _rightInkWell(String item){
    return InkWell(


      onTap: (){

      },

      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          item,
          style:TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }
}