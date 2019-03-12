import 'package:flutter/material.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('111111111111111111111111111');
  }
  @override
  Widget build(BuildContext context) {
    var formData = {'lon':'115.02932','lat':'35.76189'};
    
    return Scaffold(
      appBar: AppBar(title: Text('百姓生活+'),),
      body:FutureBuilder(
        future:request("homePageContext", formData: formData),
        builder: (context,snapshot){
          if(snapshot.hasData){
             var data=json.decode(snapshot.data.toString());
             List<Map> swiperDataList = (data['data']['slides'] as List).cast(); // 顶部轮播组件数
             List<Map> navigatorList =(data['data']['category'] as List).cast(); //类别列表
             String advertesPicture = data['data']['advertesPicture']['PICTURE_ADDRESS']; //广告图片
             String  leaderImage= data['data']['shopInfo']['leaderImage'];  //店长图片
             String  leaderPhone = data['data']['shopInfo']['leaderPhone']; //店长电话 
             List<Map> recommendList = (data['data']['recommend'] as List).cast(); // 商品推荐

              String floor1Title =data['data']['floor1Pic']['PICTURE_ADDRESS'];//楼层1的标题图片
    String floor2Title =data['data']['floor2Pic']['PICTURE_ADDRESS'];//楼层1的标题图片
    String floor3Title =data['data']['floor3Pic']['PICTURE_ADDRESS'];//楼层1的标题图片
    List<Map> floor1 = (data['data']['floor1'] as List).cast(); //楼层1商品和图片 
    List<Map> floor2 = (data['data']['floor2'] as List).cast(); //楼层1商品和图片 
    List<Map> floor3 = (data['data']['floor3'] as List).cast(); //楼层1商品和图片 


             return 
             SingleChildScrollView(
               child: Column(
               children: <Widget>[
                   SwiperDiy(swiperDataList:swiperDataList ),   //页面顶部轮播组件
                   TopNavigator(navigatorList:navigatorList),  //导航组件
                   AdBanner(advertesPicture:advertesPicture),   //广告组件 
                   LeaderPhone(leaderImage:leaderImage,leaderPhone: leaderPhone),  //广告组件 
                   Recommend(recommendList:recommendList), 

                   FloorTitle(picture_address:floor1Title),
                  FloorContent(floorGoodsList:floor1),
                  FloorTitle(picture_address:floor2Title),
                  FloorContent(floorGoodsList:floor2),
                  FloorTitle(picture_address:floor3Title),
                  FloorContent(floorGoodsList:floor3),

          HotGoods(),
               ],
             ),
             );
          }else{
            return Center(
              child: Text('加载中'),
            );
          }
        },
      )
    );
  }
}

class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  SwiperDiy({Key key,this.swiperDataList}):super(key:key);
  @override
  Widget build(BuildContext context) {
     ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
     print('设备宽度:${ScreenUtil.screenWidth}');
     print('设备高度:${ScreenUtil.screenHeight}');
    print('设备像素密度:${ScreenUtil.pixelRatio}');
    return Container(
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return Image.network("${swiperDataList[index]['image']}",fit:BoxFit.fill);
        },
        itemCount: swiperDataList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}


class TopNavigator extends StatelessWidget {
  final List navigatorList;

  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridViewItemUI(BuildContext context,item){
    return InkWell(
      onTap: (){print('点击了导航');},
      child: Column(
        children: <Widget>[
          Image.network(item['image'],width:ScreenUtil().setWidth(95)),
          Text(item['mallCategoryName'])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
     if(navigatorList.length>10){
      navigatorList.removeRange(10, navigatorList.length);
    }
    return Container(
      height: ScreenUtil().setHeight(320),
      padding:EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(4.0),
        children: navigatorList.map((item){
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}

//广告图片
class AdBanner extends StatelessWidget {
  final String advertesPicture;
  AdBanner({Key key, this.advertesPicture}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(advertesPicture),
    );
  }
}

class LeaderPhone extends StatelessWidget {
  final String leaderImage; //店长图片
  final String leaderPhone; //店长电话
  LeaderPhone({Key key, this.leaderImage,this.leaderPhone}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: _launchURL,
        child: Image.network(leaderImage),
      ),
    );
  }

  void _launchURL() async {
    String url = 'tel:'+leaderPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}


//商品推荐
class Recommend extends StatelessWidget {
  final List  recommendList;
  Recommend({Key key, this.recommendList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
       height: ScreenUtil().setHeight(380),
       margin: EdgeInsets.only(top: 10.0),
       child: Column(
         children: <Widget>[
           _titleWidget(),
           _recommedList()
         ],
       ),
    );
  }
//推荐商品标题
  Widget _titleWidget(){
     return Container(
       alignment: Alignment.centerLeft,
       padding: EdgeInsets.fromLTRB(10.0, 2.0, 0,5.0),
       decoration: BoxDecoration(
         color:Colors.white,
         border: Border(
           bottom: BorderSide(width:0.5,color:Colors.black12)
         )
       ),
       child:Text(
         '商品推荐',
         style:TextStyle(color:Colors.pink)
         )
     );
  }
  Widget _recommedList(){
      return Container(
        height: ScreenUtil().setHeight(330),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recommendList.length,
          itemBuilder: (context,index){
            return _item(index);
          },
        ),
      );
  }
  Widget _item(index){
    return InkWell(
      onTap: (){},
      child: Container(
        height: ScreenUtil().setHeight(330),
        width: ScreenUtil().setWidth(250),
        padding: EdgeInsets.all(8.0),
        decoration:BoxDecoration(
          color:Colors.white,
          border:Border(
            left: BorderSide(width:0.5,color:Colors.black12)
          )
        ),
        child: Column(
          children: <Widget>[
            Image.network(recommendList[index]['image']),
            Text('￥${recommendList[index]['mallPrice']}'),
            Text(
              '￥${recommendList[index]['price']}',
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color:Colors.grey
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FloorTitle extends StatelessWidget {
  final String picture_address; // 图片地址
  FloorTitle({Key key, this.picture_address}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Image.network(picture_address),
    );
  }
}

//楼层商品组件
class FloorContent extends StatelessWidget {
  final List floorGoodsList;
  FloorContent({Key key, this.floorGoodsList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _firstRow(),
          _otherGoods()
        ],
      ),
    );
  }
  Widget _firstRow(){
    return Row(
      children: <Widget>[
        _goodsItem(floorGoodsList[0]),
        Column(
          children: <Widget>[
           _goodsItem(floorGoodsList[1]),
           _goodsItem(floorGoodsList[2]),
          ],
        )
      ],
    );
  }
  Widget _otherGoods(){
    return Row(
      children: <Widget>[
       _goodsItem(floorGoodsList[3]),
       _goodsItem(floorGoodsList[4]),
      ],
    );
  }
  Widget _goodsItem(Map goods){
    return Container(
      width:ScreenUtil().setWidth(375),
      child: InkWell(
        onTap:(){print('点击了楼层商品');},
        child: Image.network(goods['image']),
      ),
    );
  }
}


class HotGoods extends StatefulWidget {
  _HotGoodsState createState() => _HotGoodsState();
}
class _HotGoodsState extends State<HotGoods> {
   void initState() { 
     super.initState();
     request('homePageBelowConten', formData: 1).then((val){
         print(val);
      });
   }
  @override
  Widget build(BuildContext context) {
    return Container(
       child:Text('1111'),
    );
  }
}
