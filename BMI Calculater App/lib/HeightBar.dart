// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class HeightBar extends StatefulWidget {
  const HeightBar({
    super.key,
  });

  @override
  State<HeightBar> createState() => _HeightBarState();
}

class _HeightBarState extends State<HeightBar> {
  int _currentValue = 999;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: Colors.grey.withOpacity(.2), width: 1)),
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(.2), blurStyle: BlurStyle.outer, blurRadius: 2),
        ],
      ),
      child: Column(
        children: [
          NumberPicker(
            minValue: 1,
            maxValue: 999,
            itemCount: 7,
            itemWidth: 43.5,
            value: _currentValue,
            axis: Axis.horizontal,
            selectedTextStyle: const TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
            textStyle: const TextStyle(fontWeight: FontWeight.w900, color: Colors.grey, fontSize: 12),
            onChanged: (index) {
              setState(() => _currentValue = index);
            },
          ),
          const Center(
            child: SizedBox(
              height: 60,
              child: Row(
                children: [
                  Spacer(flex: 1),
                  VerticalDivider(color: Colors.grey, thickness: 2, indent: 15),
                  Spacer(flex: 2),
                  VerticalDivider(color: Colors.grey, thickness: 2, indent: 15),
                  Spacer(flex: 2),
                  VerticalDivider(color: Colors.grey, thickness: 2, indent: 15),
                  Spacer(flex: 2),
                  VerticalDivider(color: Colors.blue, thickness: 2),
                  Spacer(flex: 2),
                  VerticalDivider(color: Colors.grey, thickness: 2, indent: 15),
                  Spacer(flex: 2),
                  VerticalDivider(color: Colors.grey, thickness: 2, indent: 15),
                  Spacer(flex: 2),
                  VerticalDivider(color: Colors.grey, thickness: 2, indent: 15),
                  Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
