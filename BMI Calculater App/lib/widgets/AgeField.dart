// ignore_for_file: file_names

import 'package:bmi_calculater_app/constants.dart';
import 'package:bmi_calculater_app/cubits/cubit/bmi_cubit.dart';
import 'package:bmi_calculater_app/my_flutter_app_icons.dart';
import 'package:bmi_calculater_app/widgets/ResponsiveText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      padding: const EdgeInsets.symmetric(vertical: 7.5),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: Colors.grey.withOpacity(.3), width: 2)),
        borderRadius: BorderRadius.circular(kRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              age--;
              age = age.clamp(minValue, maxValue);
              BlocProvider.of<BmiCubit>(context).age = age;
              setState(() {});
            },
            child: const Icon(MyFlutterApp.minus_squared_alt),
          ),
          Expanded(
            child: NumberPicker(
              minValue: minValue,
              maxValue: maxValue,
              value: age,
              itemCount: 1,
              itemHeight: MediaQuery.sizeOf(context).width * .12,
              textStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w900, fontSize: getResponsiveFontSize(context: context, fontSize: 22)),
              selectedTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: getResponsiveFontSize(context: context, fontSize: 22)),
              onChanged: (index) {
                age = index;
                BlocProvider.of<BmiCubit>(context).age = age;
                setState(() {});
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              age++;
              age = age.clamp(minValue, maxValue);
              BlocProvider.of<BmiCubit>(context).age = age;
              setState(() {});
            },
            child: const Icon(MyFlutterApp.plus_squared_alt),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
