import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedClassDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ConstrainedBox( // 约束盒子组件， 添加额外的约束条件child上
            constraints: const BoxConstraints.expand(),
            child: Image.network('https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1548317700&di=3b67424f4745bf4945fa9e8fead6c4d9&src=http://img1.cache.netease.com/catchpic/D/D8/D8F8AE059CD5A3BD6453062888351175.jpg'),

          ),
          Center(
            child: ClipRect( // 可以裁切的矩形
              child: BackdropFilter( // 背景过滤器
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Opacity(
                  opacity:  0.5,
                  child: Container(
                    width: 500.0,
                    height: 700.0,
                    decoration: BoxDecoration(color: Colors.grey.shade200),
                    child: Center(
                      child: Text(
                        'ST',
                        style: Theme.of(context).textTheme.display3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}