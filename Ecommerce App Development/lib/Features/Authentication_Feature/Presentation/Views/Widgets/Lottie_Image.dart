// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieImage extends StatefulWidget {
  const LottieImage(this.path, {super.key, this.seconds = 3, this.reverse = true});

  final String path;
  final int seconds;
  final bool reverse;

  @override
  State<LottieImage> createState() => _LottieImageState();
}

class _LottieImageState extends State<LottieImage> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late CurvedAnimation animation;

  @override
  void initState() {
    if (widget.reverse) {
      animationController = AnimationController(vsync: this, duration: Duration(seconds: widget.seconds))..repeat(reverse: widget.reverse);
    } else {
      animationController = AnimationController(vsync: this, duration: Duration(seconds: widget.seconds))..forward();
    }
    animation = CurvedAnimation(parent: animationController, curve: Curves.linear);
    super.initState();
  }

  @override
  void dispose() {
    animation.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Lottie.asset(widget.path, controller: animation),
    );
  }
}
