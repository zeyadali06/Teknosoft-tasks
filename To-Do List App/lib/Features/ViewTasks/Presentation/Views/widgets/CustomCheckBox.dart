// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_list_app/constants.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key, this.onPressed, required this.initStateIsChecked});

  final Future<void> Function()? onPressed;
  final bool initStateIsChecked;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  late bool isChecked;

  @override
  void initState() {
    isChecked = widget.initStateIsChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: kPrimaryColor, width: 1.5),
      ),
      width: 32,
      height: 32,
      child: IconButton(
        onPressed: () async {
          await widget.onPressed?.call();
          setState(() {
            isChecked = !isChecked;
          });
        },
        highlightColor: kPrimaryColor.withOpacity(.1),
        splashColor: kPrimaryColor.withOpacity(.1),
        padding: const EdgeInsets.all(0),
        icon: AnimatedCrossFade(
          alignment: Alignment.center,
          firstChild: const Icon(Icons.check, size: 0),
          secondChild: const Icon(Icons.check, color: kPrimaryColor),
          crossFadeState: isChecked ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 150),
        ),
      ),
    );
  }
}
