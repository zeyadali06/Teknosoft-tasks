// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ImportantStar extends StatelessWidget {
  const ImportantStar({super.key, this.onPressed, required this.isChecked});

  final Future<void> Function()? onPressed;
  final Icon checked = const Icon(Icons.star, color: Color(0xff68a5a0), size: 28);
  final Icon notChecked = const Icon(Icons.star_border, color: Color(0xffbad7db), size: 26);
  final bool isChecked;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        if (onPressed != null) {
          await onPressed!();
        }
      },
      icon: isChecked ? checked : notChecked,
    );
  }
}
