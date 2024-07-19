// ignore_for_file: file_names

import 'package:bmi_calculater_app/ResaultPage.dart';
import 'package:bmi_calculater_app/cubits/cubit/bmi_cubit.dart';
import 'package:bmi_calculater_app/widgets/AgeField.dart';
import 'package:bmi_calculater_app/widgets/GenderChoices.dart';
import 'package:bmi_calculater_app/widgets/HeightBar.dart';
import 'package:bmi_calculater_app/widgets/ResponsiveText.dart';
import 'package:bmi_calculater_app/widgets/WeightBar.dart';
import 'package:bmi_calculater_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(flex: 2, child: SizedBox(height: 10)),
                  Text(
                    'BMI Calculator',
                    style: TextStyle(color: Colors.black, fontSize: getResponsiveFontSize(context: context, fontSize: 22), fontWeight: FontWeight.w900),
                  ),
                  const Expanded(flex: 2, child: SizedBox(height: 10)),
                  Center(
                    child: Text(
                      'Gender',
                      style: TextStyle(color: Colors.black, fontSize: getResponsiveFontSize(context: context, fontSize: 14), fontWeight: FontWeight.w900),
                    ),
                  ),
                  const Expanded(flex: 1, child: SizedBox(height: 5)),
                  const GenderChoices(),
                  const Expanded(flex: 2, child: SizedBox(height: 10)),
                  Center(
                    child: Text(
                      'Height (cm)',
                      style: TextStyle(color: Colors.black, fontSize: getResponsiveFontSize(context: context, fontSize: 14), fontWeight: FontWeight.w900),
                    ),
                  ),
                  const Expanded(flex: 2, child: SizedBox(height: 10)),
                  const HeightBar(),
                  const Expanded(flex: 2, child: SizedBox(height: 15)),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  'Age',
                                  style: TextStyle(color: Colors.black, fontSize: getResponsiveFontSize(context: context, fontSize: 14), fontWeight: FontWeight.w900),
                                ),
                              ),
                              const Expanded(child: SizedBox(height: 10)),
                              const AgeField(),
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            children: [
                              Center(
                                child: Text(
                                  'Weight (kg)',
                                  style: TextStyle(color: Colors.black, fontSize: getResponsiveFontSize(context: context, fontSize: 14), fontWeight: FontWeight.w900),
                                ),
                              ),
                              const Expanded(child: SizedBox(height: 10)),
                              const WeightBar(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Expanded(flex: 2, child: SizedBox(height: 10)),
                  BlocListener<BmiCubit, BmiState>(
                    listener: (context, state) {
                      if (state is BmiInitial) {
                      } else if (state is BmiSuccess) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                          return const ResaultPage();
                        }));
                      } else if (state is BmiFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please try again.')));
                      }
                    },
                    child: MaterialButton(
                      onPressed: () {
                        BlocProvider.of<BmiCubit>(context).calculateBMI();
                      },
                      minWidth: double.infinity,
                      height: 50,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRadius)),
                      color: const Color(0xFF2566cf),
                      child: Text(
                        'CALCULATE BMI',
                        style: TextStyle(color: Colors.white, fontSize: getResponsiveFontSize(context: context, fontSize: 16), fontWeight: FontWeight.w800),
                      ),
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
