// ignore_for_file: file_names

import 'package:bmi_calculater_app/AgeField.dart';
import 'package:bmi_calculater_app/GenderChoices.dart';
import 'package:bmi_calculater_app/HeightBar.dart';
import 'package:bmi_calculater_app/WeightBar.dart';
import 'package:bmi_calculater_app/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 2),
            const Text(
              'BMI Calculator',
              style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w900),
            ),
            const Spacer(flex: 2),
            const Center(
              child: Text(
                'Gender',
                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900),
              ),
            ),
            const Spacer(flex: 1),
            const GenderChoices(),
            const Spacer(flex: 2),
            const Center(
              child: Text(
                'Height (cm)',
                style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900),
              ),
            ),
            const Spacer(flex: 2),
            const HeightBar(),
            const Spacer(flex: 2),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Age',
                          style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(height: 25),
                      AgeField(),
                    ],
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Weight (kg)',
                          style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w900),
                        ),
                      ),
                      SizedBox(height: 25),
                      WeightBar(),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(flex: 2),
            MaterialButton(
              onPressed: () {},
              minWidth: double.infinity,
              height: 50,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRadius)),
              color: const Color(0xFF2566cf),
              child: const Text(
                'CALCULATE BMI',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
