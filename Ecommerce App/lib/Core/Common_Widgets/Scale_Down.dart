import 'package:flutter/material.dart';

class ScaleDown extends StatelessWidget {
  const ScaleDown({super.key, required this.child, this.flex, this.fit});
  final Widget? child;
  final int? flex;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex ?? 1,
      child: FittedBox(
        fit: fit ?? BoxFit.scaleDown,
        child: child,
      ),
    );
  }
}
