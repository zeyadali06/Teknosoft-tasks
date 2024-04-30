// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomPopScope extends StatelessWidget {
  const CustomPopScope({super.key, required this.child, required this.toScreenPath});

  final Widget child;
  final String toScreenPath;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        Navigator.of(context).pushReplacementNamed(toScreenPath);
      },
      child: child,
    );
  }
}
