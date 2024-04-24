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
          colors: [Color(0xfff2f2fd), Color(0xffccd3ef)],
        ),
      ),
      child: child,
    );
  }
}
