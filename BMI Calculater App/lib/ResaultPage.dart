import 'package:bmi_calculater_app/constants.dart';
import 'package:bmi_calculater_app/widgets/BMIResault.dart';
import 'package:bmi_calculater_app/widgets/InstructionsContainer.dart';
import 'package:bmi_calculater_app/widgets/ResponsiveText.dart';
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
            Text('Back', style: TextStyle(fontWeight: FontWeight.w800, fontSize: getResponsiveFontSize(context: context, fontSize: 18))),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Result', style: TextStyle(fontWeight: FontWeight.w900, fontSize: getResponsiveFontSize(context: context, fontSize: 22))),
                  const Expanded(child: SizedBox(height: 5)),
                  const BMIResault(),
                  const Expanded(child: SizedBox(height: 5)),
                  const UserInfo(),
                  const Expanded(child: SizedBox(height: 5)),
                  const InstructionsContainer(),
                  const Expanded(child: SizedBox(height: 5)),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    minWidth: double.infinity,
                    height: 50,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRadius)),
                    color: const Color(0xFF2566cf),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'TRY AGAIN',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: getResponsiveFontSize(context: context, fontSize: 16), fontFamily: 'Roboto'),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.refresh, color: Colors.white)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
