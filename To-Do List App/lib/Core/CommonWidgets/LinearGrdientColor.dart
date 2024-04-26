// ignore_for_file: file_names

import 'package:flutter/material.dart';

class GradientColor extends StatelessWidget {
  const GradientColor({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xffeff3fe), Color(0xffbec9ee)],
        ),
      ),
      child: child,
    );
  }
}
