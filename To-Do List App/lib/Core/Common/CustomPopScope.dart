// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomPopScope extends StatelessWidget {
  const CustomPopScope({super.key, required this.child, required this.toScreenPath});

  final Widget child;
  final String toScreenPath;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value) {
        GoRouter.of(context).pushReplacement(toScreenPath);
      },
      child: child,
    );
  }
}
