// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/constants.dart';

// ignore: must_be_immutable
class ImportantStar extends StatefulWidget {
  const ImportantStar({super.key, this.onPressed, required this.initStateIsChecked});

  final Future<void> Function()? onPressed;
  final bool initStateIsChecked;

  @override
  State<ImportantStar> createState() => _ImportantStarState();
}

class _ImportantStarState extends State<ImportantStar> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await widget.onPressed?.call();
        setState(() {});
      },
      icon: widget.initStateIsChecked ? checked : notChecked,
    );
  }
}
