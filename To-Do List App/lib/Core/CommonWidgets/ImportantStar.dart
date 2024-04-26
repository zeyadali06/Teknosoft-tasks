// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ImportantStar extends StatefulWidget {
  const ImportantStar({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  State<ImportantStar> createState() => _ImportantStarState();
}

class _ImportantStarState extends State<ImportantStar> {
  IconData icon = Icons.star_border;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (icon == Icons.star_border) {
          icon = Icons.star;
        } else {
          icon = Icons.star_border;
        }
        widget.onPressed!.call();
        setState(() {});
      },
      icon: Icon(icon, color: const Color(0xff68a5a0), size: 28),
    );
  }
}
