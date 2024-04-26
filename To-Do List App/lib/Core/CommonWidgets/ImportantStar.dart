// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ImportantStar extends StatefulWidget {
  const ImportantStar({super.key, this.onPressed, required this.initStateIsChecked});

  final Future<void> Function()? onPressed;
  final bool initStateIsChecked;

  @override
  State<ImportantStar> createState() => _ImportantStarState();
}

class _ImportantStarState extends State<ImportantStar> {
  Icon checked = const Icon(Icons.star, color: Color(0xff68a5a0), size: 28);
  Icon notChecked = const Icon(Icons.star_border, color: Color(0xffbad7db), size: 26);
  late Icon icon;

  @override
  void initState() {
    icon = widget.initStateIsChecked ? checked : notChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        if (icon.icon == checked.icon) {
          icon = notChecked;
        } else {
          icon = checked;
        }
        await widget.onPressed?.call();
        setState(() {});
      },
      icon: icon,
    );
  }
}
