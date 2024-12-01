import 'package:bmi_calculater_app/constants.dart';
import 'package:bmi_calculater_app/cubits/cubit/bmi_cubit.dart';
import 'package:bmi_calculater_app/my_flutter_app_icons.dart';
import 'package:bmi_calculater_app/widgets/ResponsiveText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.grey.withOpacity(.2)),
        borderRadius: BorderRadius.circular(kRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocProvider.of<BmiCubit>(context).gender == male
                  ? Icon(MyFlutterApp.male, size: MediaQuery.sizeOf(context).width * .08)
                  : Icon(MyFlutterApp.female, size: MediaQuery.sizeOf(context).width * .08),
              Text(
                BlocProvider.of<BmiCubit>(context).gender,
                style: TextStyle(color: Colors.grey, fontSize: getResponsiveFontSize(context: context, fontSize: 16), fontWeight: FontWeight.w500, fontFamily: 'Roboto'),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                BlocProvider.of<BmiCubit>(context).age.toString(),
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: getResponsiveFontSize(context: context, fontSize: 22)),
              ),
              Text('Age', style: TextStyle(color: Colors.grey, fontSize: getResponsiveFontSize(context: context, fontSize: 16), fontWeight: FontWeight.w500, fontFamily: 'Roboto')),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                BlocProvider.of<BmiCubit>(context).height.toString(),
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: getResponsiveFontSize(context: context, fontSize: 22)),
              ),
              Text('Height', style: TextStyle(color: Colors.grey, fontSize: getResponsiveFontSize(context: context, fontSize: 16), fontWeight: FontWeight.w500, fontFamily: 'Roboto')),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                BlocProvider.of<BmiCubit>(context).weight.toString(),
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: getResponsiveFontSize(context: context, fontSize: 22)),
              ),
              Text('Weight', style: TextStyle(color: Colors.grey, fontSize: getResponsiveFontSize(context: context, fontSize: 16), fontWeight: FontWeight.w500, fontFamily: 'Roboto')),
            ],
          )
        ],
      ),
    );
  }
}
