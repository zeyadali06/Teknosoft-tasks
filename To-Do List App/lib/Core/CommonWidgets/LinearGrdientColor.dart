// ignore_for_file: file_names

import 'package:flutter/material.dart';

class GradientColor extends StatelessWidget {
  const GradientColor({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xffffffff), Color(0xffcad3f0)],
        ),
      ),
      child: child,
    );
  }
}
