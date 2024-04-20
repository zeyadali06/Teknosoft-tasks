// ignore_for_file: file_names

import 'package:bmi_calculater_app/constants.dart';
import 'package:bmi_calculater_app/cubits/cubit/bmi_cubit.dart';
import 'package:bmi_calculater_app/my_flutter_app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderChoices extends StatefulWidget {
  const GenderChoices({super.key});

  @override
  State<GenderChoices> createState() => _GenderChoicesState();
}

class _GenderChoicesState extends State<GenderChoices> {
  late Widget chosedWidget;
  int index = 0;

  @override
  void initState() {
    chosedWidget = const ChoosedWidget(gender: male);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 1,
      child: NavigationBar(
        selectedIndex: index,
        elevation: 0,
        onDestinationSelected: (value) {
          index = value;
          BlocProvider.of<BmiCubit>(context).gender = index == 0 ? male : female;
          setState(() {});
        },
        destinations: [
          NavigationDestination(
            icon: Padding(padding: const EdgeInsets.only(right: 7.5), child: whichChoosed(index, male)),
            label: '',
          ),
          NavigationDestination(
            icon: Padding(padding: const EdgeInsets.only(left: 7.5), child: whichChoosed(index, female)),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget whichChoosed(int index, String gender) {
    if (gender == male) {
      if (index == 0) {
        return const ChoosedWidget(gender: male);
      } else {
        return const UnChoosedWidget(gender: male);
      }
    }

    if (gender == female) {
      if (index == 0) {
        return const UnChoosedWidget(gender: female);
      } else {
        return const ChoosedWidget(gender: female);
      }
    }
    return const ChoosedWidget(gender: male);
  }
}

class ChoosedWidget extends StatelessWidget {
  const ChoosedWidget({super.key, required this.gender});

  final String gender;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFdfe9f9),
            border: Border.all(color: kPrimaryColor, width: 2),
            borderRadius: BorderRadius.circular(kRadius),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurStyle: BlurStyle.outer,
                blurRadius: 10,
                spreadRadius: -4,
                offset: Offset(4, 4),
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  gender == male ? MyFlutterApp.male : MyFlutterApp.female,
                  size: MediaQuery.of(context).size.width / 5.5,
                  color: kPrimaryColor,
                ),
                const SizedBox(height: 10),
                Text(gender, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
        const Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(top: 15, right: 15),
            child: Icon(
              MyFlutterApp.ok_circled,
              color: kPrimaryColor,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}

class UnChoosedWidget extends StatelessWidget {
  const UnChoosedWidget({super.key, required this.gender});

  final String gender;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFd9d9d9),
        border: Border.all(color: const Color(0xFFd9d9d9), width: 2),
        borderRadius: BorderRadius.circular(kRadius),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurStyle: BlurStyle.outer,
            blurRadius: 10,
            spreadRadius: -4,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              gender == male ? MyFlutterApp.male : MyFlutterApp.female,
              size: MediaQuery.of(context).size.width / 5.5,
              color: const Color(0xFF8b8b8b),
            ),
            const SizedBox(height: 10),
            Text(gender, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
