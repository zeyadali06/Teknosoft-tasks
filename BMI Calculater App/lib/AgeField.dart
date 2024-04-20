// ignore_for_file: file_names

import 'package:bmi_calculater_app/constants.dart';
import 'package:bmi_calculater_app/my_flutter_app_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class AgeField extends StatefulWidget {
  const AgeField({super.key});

  @override
  State<AgeField> createState() => _AgeFieldState();
}

class _AgeFieldState extends State<AgeField> {
  int age = 1;
  final int maxValue = 200;
  final int minValue = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: Colors.grey.withOpacity(.3), width: 2)),
        borderRadius: BorderRadius.circular(kRadius),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: const Icon(MyFlutterApp.minus_squared_alt),
            onTap: () {
              setState(() {
                age--;
                age = age.clamp(minValue, maxValue);
              });
            },
          ),
          NumberPicker(
            minValue: minValue,
            maxValue: maxValue,
            value: age,
            itemCount: 1,
            axis: Axis.vertical,
            itemHeight: 30,
            itemWidth: 50,
            textStyle: const TextStyle(fontSize: 0),
            selectedTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 22),
            onChanged: (index) {
              age = index;

              setState(() {});
            },
          ),
          GestureDetector(
            child: const Icon(MyFlutterApp.plus_squared_alt),
            onTap: () {
              setState(() {
                age++;
                age = age.clamp(minValue, maxValue);
              });
            },
          ),
        ],
      ),
    );
  }
}
