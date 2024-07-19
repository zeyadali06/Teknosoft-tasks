// ignore_for_file: file_names

import 'package:bmi_calculater_app/cubits/cubit/bmi_cubit.dart';
import 'package:bmi_calculater_app/widgets/ResponsiveText.dart';
import 'package:bmi_calculater_app/widgets/Triangle.dart';
import 'package:bmi_calculater_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';

class WeightBar extends StatefulWidget {
  const WeightBar({super.key});

  @override
  State<WeightBar> createState() => _WeightBarState();
}

class _WeightBarState extends State<WeightBar> {
  int weight = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: Colors.grey.withOpacity(.3), width: 2)),
        borderRadius: BorderRadius.circular(kRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                const Triangle(),
                NumberPicker(
                  minValue: 1,
                  maxValue: 999,
                  value: weight,
                  itemHeight: MediaQuery.sizeOf(context).width * .12,
                  itemWidth: ((MediaQuery.sizeOf(context).width - 15 - kPadding * 2) / 2) / 3,
                  itemCount: 3,
                  axis: Axis.horizontal,
                  textStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w900, fontSize: getResponsiveFontSize(context: context, fontSize: 16)),
                  selectedTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: getResponsiveFontSize(context: context, fontSize: 22)),
                  onChanged: (index) {
                    weight = index;
                    BlocProvider.of<BmiCubit>(context).weight = weight;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
