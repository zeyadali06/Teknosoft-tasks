import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieImage extends StatefulWidget {
  const LottieImage({super.key});

  @override
  State<LottieImage> createState() => _LottieImageState();
}

class _LottieImageState extends State<LottieImage> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 5))..repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset("assets/images/Animation - 1714259528204.json", controller: animationController);
  }
}
