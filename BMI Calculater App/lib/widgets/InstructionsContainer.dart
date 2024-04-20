// ignore_for_file: file_names

import 'package:bmi_calculater_app/constants.dart';
import 'package:flutter/material.dart';

class InstructionsContainer extends StatelessWidget {
  const InstructionsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.grey.withOpacity(.2)),
        borderRadius: BorderRadius.circular(kRadius),
      ),
      padding: const EdgeInsets.all(15),
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16, fontFamily: 'Roboto', height: 1.5),
          children: [
            TextSpan(text: 'A BMI Of'),
            TextSpan(text: ' 18.5 - 24.9 ', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)),
            TextSpan(text: 'indicates that your weight is in the'),
            TextSpan(text: ' normal ', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold)),
            TextSpan(text: 'normal category for a person of your height.\n\n'),
            TextSpan(text: 'Mantaining a healthy weight reduce the risk of diseases associated with overweight and obesity.'),
          ],
        ),
      ),
    );
  }
}
