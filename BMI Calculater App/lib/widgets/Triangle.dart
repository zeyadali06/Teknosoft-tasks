// ignore_for_file: file_names

import 'package:bmi_calculater_app/constants.dart';
import 'package:flutter/material.dart';

class Triangle extends StatelessWidget {
  const Triangle({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _TrianglePath(),
      child: Container(
        color: kPrimaryColor,
        width: 15,
        height: 15,
      ),
    );
  }
}

class _TrianglePath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
