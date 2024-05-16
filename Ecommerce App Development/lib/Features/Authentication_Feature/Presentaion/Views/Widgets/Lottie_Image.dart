// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieImage extends StatefulWidget {
  const LottieImage({super.key, required this.path});

  final String path;

  @override
  State<LottieImage> createState() => _LottieImageState();
}

class _LottieImageState extends State<LottieImage> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late CurvedAnimation animation;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..reverse()
      ..repeat(reverse: true);
    animation = CurvedAnimation(parent: animationController, curve: Curves.linear);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: double.infinity,
      // height: 250,
      child: Lottie.asset(widget.path, controller: animation),
    );
  }
}
