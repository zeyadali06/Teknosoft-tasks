// ignore_for_file: file_names

import 'package:bmi_calculater_app/constants.dart';
import 'package:bmi_calculater_app/widgets/BMIResault.dart';
import 'package:bmi_calculater_app/widgets/InstructionsContainer.dart';
import 'package:bmi_calculater_app/widgets/UserInfo.dart';
import 'package:flutter/material.dart';

class ResaultPage extends StatelessWidget {
  const ResaultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.keyboard_arrow_left, size: 42),
            ),
            const Text('Back', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Result', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22)),
            const Spacer(flex: 1),
            const BMIResault(),
            const Spacer(flex: 2),
            const UserInfo(),
            const Spacer(flex: 3),
            const InstructionsContainer(),
            const Spacer(flex: 3),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              minWidth: double.infinity,
              height: 50,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRadius)),
              color: const Color(0xFF2566cf),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TRY AGAIN',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16, fontFamily: 'Roboto'),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.refresh, color: Colors.white)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
