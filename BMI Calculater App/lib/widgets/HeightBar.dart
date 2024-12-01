import 'package:bmi_calculater_app/constants.dart';
import 'package:bmi_calculater_app/cubits/cubit/bmi_cubit.dart';
import 'package:bmi_calculater_app/widgets/ResponsiveText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';

class HeightBar extends StatefulWidget {
  const HeightBar({
    super.key,
  });

  @override
  State<HeightBar> createState() => _HeightBarState();
}

class _HeightBarState extends State<HeightBar> {
  int _currentValue = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(BorderSide(color: Colors.grey.withOpacity(.3), width: 2)),
        borderRadius: const BorderRadius.all(Radius.circular(kRadius)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.2),
            blurStyle: BlurStyle.outer,
            blurRadius: 5,
            spreadRadius: -2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          NumberPicker(
            minValue: 1,
            maxValue: 999,
            itemCount: 7,
            itemWidth: (MediaQuery.sizeOf(context).width - 80) / 7,
            itemHeight: MediaQuery.sizeOf(context).width * .12,
            value: _currentValue,
            axis: Axis.horizontal,
            textStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w900, fontSize: getResponsiveFontSize(context: context, fontSize: 12)),
            selectedTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: getResponsiveFontSize(context: context, fontSize: 22)),
            onChanged: (index) {
              BlocProvider.of<BmiCubit>(context).height = index;
              _currentValue = index;
              setState(() {});
            },
          ),
          const Center(
            child: SizedBox(
              height: 60,
              child: Row(
                children: [
                  Spacer(flex: 1),
                  VerticalDivider(color: Colors.grey, thickness: 2, indent: 15),
                  Spacer(flex: 2),
                  VerticalDivider(color: Colors.grey, thickness: 2, indent: 15),
                  Spacer(flex: 2),
                  VerticalDivider(color: Colors.grey, thickness: 2, indent: 15),
                  Spacer(flex: 2),
                  VerticalDivider(color: kPrimaryColor, thickness: 2),
                  Spacer(flex: 2),
                  VerticalDivider(color: Colors.grey, thickness: 2, indent: 15),
                  Spacer(flex: 2),
                  VerticalDivider(color: Colors.grey, thickness: 2, indent: 15),
                  Spacer(flex: 2),
                  VerticalDivider(color: Colors.grey, thickness: 2, indent: 15),
                  Spacer(flex: 1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
