// ignore_for_file: file_names

import 'package:bmi_calculater_app/Triangle.dart';
import 'package:bmi_calculater_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class WeightBar extends StatefulWidget {
  const WeightBar({super.key});

  @override
  State<WeightBar> createState() => _WeightBarState();
}

class _WeightBarState extends State<WeightBar> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: Colors.grey.withOpacity(.3), width: 2)),
        borderRadius: BorderRadius.circular(kRadius),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Triangle(),
          NumberPicker(
            minValue: 1,
            maxValue: 999,
            value: value,
            itemCount: 3,
            axis: Axis.horizontal,
            itemHeight: 30,
            itemWidth: 40,
            textStyle: const TextStyle(fontWeight: FontWeight.w900, color: Colors.grey, fontSize: 16),
            selectedTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 22),
            onChanged: (index) {
              value = index;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
