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
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xfff5f6fc), Color(0xffccd3ef)],
        ),
      ),
      child: child,
    );
  }
}
