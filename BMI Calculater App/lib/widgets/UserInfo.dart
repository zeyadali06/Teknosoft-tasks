// ignore_for_file: file_names

import 'package:bmi_calculater_app/constants.dart';
import 'package:bmi_calculater_app/cubits/cubit/bmi_cubit.dart';
import 'package:bmi_calculater_app/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
              BlocProvider.of<BmiCubit>(context).gender == male ? const Icon(MyFlutterApp.male, size: 36) : const Icon(MyFlutterApp.female, size: 36),
              Text(BlocProvider.of<BmiCubit>(context).gender, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontFamily: 'Roboto')),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(BlocProvider.of<BmiCubit>(context).age.toString(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 22)),
              const Text('Age', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontFamily: 'Roboto')),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(BlocProvider.of<BmiCubit>(context).height.toString(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 22)),
              const Text('Height', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontFamily: 'Roboto')),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(BlocProvider.of<BmiCubit>(context).weight.toString(), style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 22)),
              const Text('Weight', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontFamily: 'Roboto')),
            ],
          )
        ],
      ),
    );
  }
}
