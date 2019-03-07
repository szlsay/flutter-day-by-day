// import 'package:flutter/material.dart';
// class IndexPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('百姓生活+'),),
//       body: Center(
//         child:Text(' 百姓生活+')
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class IndexPage extends StatelessWidget {
  final Widget child;

  IndexPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('百姓生活+'),),
      body: Center(
        child: Text('百姓生活+'),
      ),
    );
  }
}