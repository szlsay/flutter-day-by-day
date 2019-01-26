import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: BottomClipperTest(),
            child: Container(
              color: Colors.deepOrangeAccent,
              height: 200.0,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomClipperTest extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height-100);
    var firstControlPoint = Offset(size.width/4, size.height);
    var firstEndPoint = Offset(size.width/2, size.height - 100);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);


    var secondControlPoint = Offset(size.width/4*3, size.height-200);
    var secondEndPoint = Offset(size.width, size.height-100);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height-100);
    path.lineTo(size.width, 0);
    return path;
  }
  // @override
  // Path getClip(Size size) {
  //   var path = Path();
  //   path.lineTo(0, 0);
  //   path.lineTo(0, size.height-30);
  //   var firstControlPoint = Offset(size.width/2, size.height);
  //   var firstEndPoint = Offset(size.width, size.height-30);
  //   path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);
  //   path.lineTo(size.width, size.height-30);
  //   path.lineTo(size.width, 0);
  //   return path;
  // }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}