import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list_app/Core/Utils/HiveServices.dart';
import 'package:todo_list_app/Features/CreateUpdateTasks/Data/Models/TaskModel.dart';

part 'today_progress_state.dart';

class TodayProgressCubit extends Cubit<TodayProgressState> {
  TodayProgressCubit() : super(TodayProgressInitial());

  List<TaskModel> tasks = [];

  List<TaskModel> getTodayFinishedTasks() {
    try {
      List<TaskModel> res = [];

      for (TaskModel task in getData()) {
        if (task.finished && isSameDay(DateTime.now(), task.finishDate)) {
          res.add(task);
        }
      }
      tasks = res;
      emit(TodayProgressSuccess());
      return res;
    } catch (_) {
      emit(TodayProgressFailed(errMessage: "Error, try again later!"));
      return [];
    }
  }

  void startMidNightTimer() {
    final DateTime now = DateTime.now();
    final DateTime nextMidnight = DateTime(now.year, now.month, now.day + 1, 0, 0, 0);
    final Duration duration = nextMidnight.difference(now);
    Timer(duration, () => getTodayFinishedTasks());
  }
}
