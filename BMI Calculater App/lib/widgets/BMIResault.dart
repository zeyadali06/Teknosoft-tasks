import 'package:bmi_calculater_app/constants.dart';
import 'package:bmi_calculater_app/cubits/cubit/bmi_cubit.dart';
import 'package:bmi_calculater_app/widgets/ResponsiveText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          Text('Your BMI is', style: TextStyle(fontWeight: FontWeight.w900, fontSize: getResponsiveFontSize(context: context, fontSize: 14))),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.only(top: 10, bottom: 15, left: 15, right: 15),
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(kRadius)),
            ),
            child: Column(
              children: [
                Text(
                  BlocProvider.of<BmiCubit>(context).bmi.toString(),
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: getResponsiveFontSize(context: context, fontSize: 28), color: Colors.white),
                ),
                Text(
                  'kg/m2',
                  style: TextStyle(color: const Color(0xffdedcd9), fontWeight: FontWeight.w900, fontSize: getResponsiveFontSize(context: context, fontSize: 16)),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text('(${BlocProvider.of<BmiCubit>(context).category})', style: TextStyle(fontWeight: FontWeight.w900, fontSize: getResponsiveFontSize(context: context, fontSize: 14))),
        ],
      ),
    );
  }
}
