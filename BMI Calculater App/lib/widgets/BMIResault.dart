// ignore_for_file: file_names

import 'package:bmi_calculater_app/constants.dart';
import 'package:flutter/material.dart';

class BMIResault extends StatelessWidget {
  const BMIResault({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const Text('Your BMI is', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 15, left: 15, right: 15),
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(kRadius)),
            ),
            child: const Column(
              children: [
                Text(
                  '19.7',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28, color: Colors.white),
                ),
                Text(
                  'kg/m2',
                  style: TextStyle(color: Color(0xffdedcd9), fontWeight: FontWeight.w900),
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Text('(Normal)', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
        ],
      ),
    );
  }
}
