import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieImage extends StatefulWidget {
  const LottieImage(this.path, {super.key, this.seconds = 3, this.repeatWithReverse = true, this.repeatWithoutReverse = false});

  final String path;
  final int seconds;
  final bool repeatWithReverse;
  final bool repeatWithoutReverse;

  @override
  State<LottieImage> createState() => _LottieImageState();
}

class _LottieImageState extends State<LottieImage> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late CurvedAnimation animation;

  @override
  void initState() {
    if (widget.repeatWithReverse) {
      animationController = AnimationController(vsync: this, duration: Duration(seconds: widget.seconds))..repeat(reverse: true);
    } else if (widget.repeatWithoutReverse) {
      animationController = AnimationController(vsync: this, duration: Duration(seconds: widget.seconds))..repeat(reverse: false);
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
