import 'package:flutter/material.dart';

class Shape1 extends StatelessWidget {
  const Shape1({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper1(),
      child: Container(
        height: 300,
        width: 300,
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
      ),
    );
  }
}

class MyClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double h = size.height;
    double w = size.width;

    Path path1 = Path();

    //left:
    path1.lineTo(0, h / 2 - 25);
    path1.lineTo(35, h / 2);
    path1.lineTo(0, h / 2 + 25);
    path1.lineTo(0, h);

    //bottom:
    path1.lineTo(w / 2 - 35, h);
    path1.quadraticBezierTo(w / 2, h / 1.3, w / 2 + 35, h);
    path1.lineTo(w + 35, h);
    path1.lineTo(w, h);

    //right:
    path1.lineTo(w, h / 2 + 25);
    path1.lineTo(w - 35, h / 2);
    path1.lineTo(w, h / 2 - 25);
    path1.lineTo(w, 0);

    //top:
    path1.lineTo(w / 2 + 35, 0);
    path1.quadraticBezierTo(w / 2, h - h / 1.3, w / 2 - 35, 0);
    path1.lineTo(w - 35, 0);
    path1.lineTo(0, 0);

    // path1.lineTo(w, h);
    // path1.lineTo(w, 0);
    return path1;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
