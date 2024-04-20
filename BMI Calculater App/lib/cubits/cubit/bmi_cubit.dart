import 'package:bmi_calculater_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());

  int weight = 1;
  int height = 1;
  int age = 1;
  String gender = male;
  late String category;
  late double bmi;
  late String interval;

  void calculateBMI() {
    try {
      bmi = double.parse((weight / (height * height)).toStringAsFixed(4));
      category = _bmiCategory(bmi);
      emit(BmiSuccess());
    } catch (_) {
      emit(BmiFailed());
    }
  }

  String _bmiCategory(double bmi) {
    if (bmi < 18.5) {
      interval = 'smaller than 18.5';
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 25) {
      interval = '18.5 - 25';
      return 'Normal';
    } else if (bmi >= 25 && bmi < 30) {
      interval = '25 - 30';
      return 'Overweight';
    } else {
      interval = 'greater than 30';
      return 'Obese';
    }
  }
}
