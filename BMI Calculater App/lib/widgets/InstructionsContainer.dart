import 'package:bmi_calculater_app/constants.dart';
import 'package:bmi_calculater_app/cubits/cubit/bmi_cubit.dart';
import 'package:bmi_calculater_app/widgets/ResponsiveText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        text: TextSpan(
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: getResponsiveFontSize(context: context, fontSize: 16), fontFamily: 'Roboto', height: 1.5),
          children: [
            const TextSpan(text: 'A BMI that is'),
            TextSpan(
              text: ' ${BlocProvider.of<BmiCubit>(context).interval} ',
              style: TextStyle(color: kPrimaryColor, fontSize: getResponsiveFontSize(context: context, fontSize: 16), fontWeight: FontWeight.bold),
            ),
            const TextSpan(text: 'indicates that your weight is in the'),
            TextSpan(
              text: ' ${BlocProvider.of<BmiCubit>(context).category} ',
              style: TextStyle(color: kPrimaryColor, fontSize: getResponsiveFontSize(context: context, fontSize: 16), fontWeight: FontWeight.bold),
            ),
            const TextSpan(text: 'category for a person of your height.\n\n'),
            const TextSpan(text: 'Mantaining a healthy weight reduce the risk of diseases associated with overweight and obesity.'),
          ],
        ),
      ),
    );
  }
}
